![OASIS](OASISLogo.png)

---

# XLIFF Translation Memory Version 1.0

## Committee Note Draft 01

## 5 July 2025

### This version

- [ link to authoritative version of the published document ] (Authoritative)  
- [ links to one or more other versions of the published document (e.g., MD, PDF, Word, HTML, etc.) ]

### Previous version

- [ link to authoritative version of the published document ] (Authoritative)  
- [ links to one or more other versions of the published document (e.g., MD, PDF, Word, HTML, etc.) ]

### Latest version

- [ link to authoritative version of the published document ] (Authoritative)  
- [ links to one or more other versions of the published document (e.g., MD, PDF, Word, HTML, etc.) ]

### Technical Committee

[OASIS XLIFF TC](https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=3d0f1f56-8477-4b53-9b14-018dc7d3eecf)

### Chairs

- Dr. Lucía Morado Vázquez ([lucia.morado@unige.ch](mailto:lucia.morado@unige.ch)), [University of Geneva](https://www.unige.ch/en/)
- Yoshito Umaoka ([y.umaoka@gmail.com](mailto:y.umaoka@gmail.com)), Individual

### Secretaries

- Rodolfo M. Raya ([rmraya@maxprograms.com](mailto:rmraya@maxprograms.com)), [Maxprograms](https://maxprograms.com)

### Editors

- Rodolfo M. Raya ([rmraya@maxprograms.com](mailto:rmraya@maxprograms.com)), [Maxprograms](https://maxprograms.com)

### Abstract

This Committee Note describes an XLIFF-native approach for the representation and exchange of translation memory data, using plain XLIFF `<file>`, `<unit>`, and `<segment>` elements as the translation memory store itself, in place of the Translation Memory eXchange (TMX) format. The approach preserves the structure and semantics of XLIFF content, including bilingual text, inline elements, segmentation, and associated metadata, without the information loss that results from converting content to and from TMX's inline tag model. It also preserves the document order and structural relationship between translation units, file, unit, and segment, that TMX's flat, unordered list of translation units does not represent, and it allows richer metadata, such as provenance information, to be attached directly using existing XLIFF modules.

This Committee Note also addresses the exchange of translation memory data for multilingual use. Because XLIFF documents are fundamentally bilingual, the Note recommends a packaging approach in which multiple related bilingual XLIFF files are distributed together in a single ZIP package with a manifest that identifies the relationships among them.

### Citation Format

When referencing this document, the following citation format should be used:

- [ The full reference for this document in IEEE reference format ]

### Related Work

This document replaces or supersedes:

- [ The full reference to the related document in IEEE reference format ]

This document is related to:

- [XLIFF-2.2-part2]

  XLIFF Version 2.2 Part 2: Extended. Edited by Rodolfo M. Raya and Lucía Morado Vázquez 13 March 2025. OASIS Committee Specification. https://docs.oasis-open.org/xliff/xliff-core/v2.2/xliff-v2.2-part2-extended.html. Latest stage https://docs.oasis-open.org/xliff/xliff-core/v2.2/xliff-v2.2-part2-extended.html.

- [TMX 1.4b]

  Translation Memory eXchange (TMX) Version 1.4b. Edited by Yves Savourel. OSCAR Recommendation, 26 April 2005. [https://web.archive.org/web/20060528180452/http://www.lisa.org/standards/tmx/tmx.html](https://web.archive.org/web/20060528180452/http://www.lisa.org/standards/tmx/tmx.html).

## License, Document Status, and Notices

Copyright © OASIS Open 2025. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

---

## Table of Contents

- [1 Scope](#1-scope)
- [2 Definitions and Acronyms](#2-definitions-and-acronyms)
  - [2.1 Definitions](#21-definitions)
    - [2.1.1 Terms Defined Elsewhere](#211-terms-defined-elsewhere)
    - [2.1.2 Terms Defined in this Document](#212-terms-defined-in-this-document)
  - [2.2 Abbreviations and Acronyms](#22-abbreviations-and-acronyms)
- [3 Document Conventions](#3-document-conventions)
  - [3.1 Key Words](#31-key-words)
  - [3.2 Typographical Conventions](#32-typographical-conventions)
- [4 Introduction](#4-introduction)
  - [4.1 Limitations of TMX-Based Exchange](#41-limitations-of-tmx-based-exchange)
  - [4.2 Changes From the Previous Version](#42-changes-from-the-previous-version)
- [5 XLIFF as a Translation Memory Format](#5-xliff-as-a-translation-memory-format)
  - [5.1 Design Principles](#51-design-principles)
  - [5.2 Structural Order and Segment Context](#52-structural-order-and-segment-context)
  - [5.3 Provenance Metadata for Translation Memory Entries](#53-provenance-metadata-for-translation-memory-entries)
  - [5.4 Example](#54-example)
- [6 Exchange of Multilingual Translation Memory Data](#6-exchange-of-multilingual-translation-memory-data)
  - [6.1 Package Structure](#61-package-structure)
  - [6.2 Manifest File](#62-manifest-file)
  - [6.3 Example](#63-example)
- [7 Safety, Security, and Data Protection Considerations](#7-safety-security-and-data-protection-considerations)
- [8 Conformance](#8-conformance)
  - [8.1 Translation Memory Store](#81-translation-memory-store)
  - [8.2 Translation Memory Exchange Package](#82-translation-memory-exchange-package)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C Additional Annex as Needed](#annex-c-additional-annex-as-needed)
  - [C.1 Subsection Title](#c1-subsection-title)
  - [C.1.1 Sub-subsection](#c11-sub-subsection)
- [Appendix 1 Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Special Thanks](#special-thanks)
  - [Participants](#participants)
- [Appendix 2 Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)
- [Appendix 3 Additional Appendix as Needed](#appendix-3-additional-appendix-as-needed)
  - [Subsection Title](#subsection-title)
- [Sub-subsection](#sub-subsection)

---

# 1 Scope

This Committee Note describes an XLIFF-native approach for storing and exchanging translation memory (TM) data, using plain XLIFF 2.x documents in place of the Translation Memory eXchange (TMX) format.

Rather than defining a new container or converting bilingual content into a separate TM-specific format, this document recommends that XLIFF `<file>`, `<unit>`, and `<segment>` elements be used directly to hold translation units for later reuse. This preserves the full XLIFF inline element model, avoiding the loss of information that results from converting XLIFF inline markup to and from the TMX inline tag model, and preserves the structural order of content, which TMX's flat, unordered list of `<tu>` elements does not represent.

This document also describes how the XLIFF Provenance module, under development for XLIFF 2.3, can be used to record and later query information about the origin of stored translation units, such as the agent, tool, or process that produced or modified them.

Because a single XLIFF document is inherently bilingual, this document further describes a packaging convention for exchanging translation memory data across more than two languages, based on a set of related bilingual XLIFF files distributed together with a manifest.

---

# 2 Definitions and Acronyms

## 2.1 Definitions

### 2.1.1 Terms Defined Elsewhere

This document uses the following terms defined elsewhere:

- Unit [XLIFF-2.2-part2]: "A `<unit>` MAY contain both source and target content, allowing bilingual data to be stored."
- Segment [XLIFF-2.2-part2]: The `<segment>` element, used to represent the smallest unit of translatable content addressed for translation, review, or other processing.
- Provenance information [Provenance module, XLIFF 2.3, informative]: Information about the nature and origin of the localization data or process.

### 2.1.2 Terms Defined in this Document

This document defines the following terms:

- Translation memory (TM): A collection of previously translated source and target content, organized for retrieval and reuse when equal or similar source content is encountered again.
- Translation memory entry: A single stored source/target pair available for reuse, represented in this document as an XLIFF `<unit>` (or, where segmented, `<segment>`).
- Translation memory exchange package: A ZIP archive containing one or more bilingual XLIFF files together with a manifest, used to exchange translation memory data across more than two languages, as described in [6 Exchange of Multilingual Translation Memory Data](#6-exchange-of-multilingual-translation-memory-data).

## 2.2 Abbreviations and Acronyms

This document uses the following abbreviations and acronyms:

- TC: Technical Committee
- TM: Translation Memory
- TMX: Translation Memory eXchange
- TU: Translation Unit
- TUV: Translation Unit Variant (TMX)
- XML: Extensible Markup Language
- ZIP: A common archive file format

---

# 3 Document Conventions

## 3.1 Key Words

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC2119].

## 3.2 Typographical Conventions

XML element names are shown enclosed in angle brackets, for example `<unit>`. XML attribute names are shown in fixed-width type without brackets, for example `id`. XML namespace prefixes used in examples (`xlf:`, `mtc:`, `pvn:`) follow the conventions established in [XLIFF-2.2-part2] and the XLIFF 2.3 Provenance module. Example XML is shown in fenced code blocks and is illustrative; it is not necessarily complete or schema-valid.

---

# 4 Introduction

Translation memory (TM) is a core technology of the localization industry. A TM stores previously translated content so that it can be retrieved and reused when equal or similar source content is encountered again, improving consistency and reducing translation effort and cost.

Since 2005, the de facto standard for exchanging TM data between tools has been the Translation Memory eXchange (TMX) format [TMX 1.4b]. TMX was designed as a vendor-neutral interchange format, independent of any single authoring or extraction format. XLIFF, by contrast, is designed to carry bilingual (and, through packaging, multilingual) content through the localization process itself, from extraction through translation, review, and reintegration into the original format.

As XLIFF adoption has grown, and as the XLIFF inline content model, segmentation model, and metadata modules have become richer, the gap between what an XLIFF document can represent and what TMX can represent has widened. Producing a TMX export of translated content, or importing TMX leverage into an XLIFF-based workflow, requires a conversion step. That conversion step is where information is put at risk.

## 4.1 Limitations of TMX-Based Exchange

TMX and XLIFF do not share an inline content model. TMX represents inline markup with a small, generic set of placeholder elements (`<bpt>`, `<ept>`, `<it>`, `<ph>`, `<hi>`) that carry no structural relationship to the original markup beyond matched pairing and free-form type/i attributes. XLIFF represents inline content with a richer, self-describing model (`<pc>`, `<sc>`, `<ec>`, `<ph>`, `<mrk>`, `<sm>`/`<em>`, backed by `<originalData>`). Converting XLIFF inline content into TMX inline content, and back again, is a lossy, implementation-specific mapping. There is no guarantee that a round trip through TMX preserves the original XLIFF markup, and in practice it frequently does not.

TMX is defined by a Document Type Definition (DTD), not an XML Schema, and a TMX document is a self-contained top-level document with its own DOCTYPE. A TMX `<tu>` cannot be embedded inside an XLIFF document, and an XLIFF `<unit>` cannot be embedded inside a TMX document. The two formats can only be related to each other through external conversion, never through direct inclusion. This also means TMX content cannot participate in XLIFF's own extension and modularization mechanisms, such as the Translation Candidates module (`mtc:matches`, see [XLIFF-2.2-part2]), which is designed to hold XLIFF-native `<source>`/`<target>` pairs as leveraging matches inside a unit.

Finally, a TMX file is a flat, unordered collection of `<tu>` elements. TMX defines no relationship between one translation unit and the next; any notion of document order, or of which segments originally appeared near each other, is lost once content is exported to TMX (short of ad hoc use of `<prop>` or `<note>` elements to reconstruct it). XLIFF does not have this limitation: an XLIFF document is structured as `<file>` containing one or more `<unit>` elements, each containing one or more `<segment>` elements, and that hierarchy is preserved in document order. Two segments that are adjacent in an XLIFF file are known to be adjacent in the source content, which is valuable context for TM leveraging, concordance search, and quality review that a flat TMX export cannot provide.

For these reasons, this document recommends that plain XLIFF documents be used directly as the storage and interchange format for translation memory data, rather than converting content to and from TMX.

## 4.2 Changes From the Previous Version

\< This section is **REQUIRED** and **MUST** be the last numbered subsection in this section. \>
The list of changes from the previous version and any revision history can be found in Appendix 2\.

---

# 5 XLIFF as a Translation Memory Format

This section describes the recommended approach for storing translation memory data as plain XLIFF documents, using XLIFF Core elements as they are already defined, without introducing a new TM-specific vocabulary.

## 5.1 Design Principles

- **No conversion.** A TM entry is an XLIFF `<unit>` containing one or more `<segment>` elements with `<source>` and `<target>` content, exactly as produced by any XLIFF-conformant extraction, translation, or review tool. Storing that content as translation memory requires no transformation of inline markup, and retrieving it for reuse in another XLIFF document requires no transformation back.
- **Full inline fidelity.** Because TM entries remain XLIFF `<unit>` elements, they retain the full XLIFF inline element model (`<pc>`, `<sc>`/`<ec>`, `<ph>`, `<mrk>`, `<sm>`/`<em>`) together with any associated `<originalData>`, instead of being reduced to the smaller TMX inline tag set.
- **Preserved order.** Units and segments remain in the document order in which they were extracted, inside their originating `<file>` (and, where used, `<group>`). See [5.2 Structural Order and Segment Context](#52-structural-order-and-segment-context).
- **Extensibility through existing modules.** Any XLIFF module that can annotate a `<file>`, `<unit>`, or `<segment>` in a normal XLIFF document, such as metadata, notes, size and length restriction, or the Provenance module described in [5.3 Provenance Metadata for Translation Memory Entries](#53-provenance-metadata-for-translation-memory-entries), applies equally when that document is used as a TM store. No parallel metadata model is required.

## 5.2 Structural Order and Segment Context

TMX represents a translation memory as a flat, unordered collection of `<tu>` elements. TMX defines no relationship between one translation unit and any other; the position of a `<tu>` in a TMX file carries no meaning.

An XLIFF document used as a TM store retains the `<file>` &gt; `<unit>` &gt; `<segment>` hierarchy defined by XLIFF Core. This hierarchy carries information that a flat TU list cannot:

- **Document order** is preserved. Segments that were adjacent in the original content remain adjacent, which supports context-aware leveraging (for example, preferring a match whose neighboring segments also match) and concordance search that shows a hit in its original surrounding context.
- **Provenance of the source document** is preserved. The enclosing `<file>` retains attributes such as `original`, and can carry `<file>`-level metadata, so that every stored `<unit>` remains traceable to the document it came from.
- **Grouping** is preserved. Where the source content used `<group>` to represent structural divisions (chapters, UI screens, table rows, and so on), those divisions remain available to a TM consumer, instead of being discarded at export time.

A translation memory consumer that only needs unordered TU-style lookup can still treat every `<segment>` in every `<unit>` of every `<file>` as an independent entry, exactly as it would treat entries in a TMX file. The XLIFF-based representation is a strict superset of that capability: it does not require order and context to be used, but it does not discard them either.

## 5.3 Provenance Metadata for Translation Memory Entries

Reuse decisions in a translation memory workflow are often qualified by information about the origin of a given entry: who or what produced or last modified it, when, using what tool, and why. TMX addresses this only partially, through the `creationid`, `creationdate`, `changeid`, `changedate`, and `<prop>`/`<note>` mechanisms defined for `<tu>` and `<tuv>`.

The XLIFF 2.3 Provenance module (`pvn:`, under development by the OASIS XLIFF TC, see the `xliff-23` provenance module in this repository) is designed to record equivalent, and richer, information directly on XLIFF Core elements, using the `<pvn:provenance>` and `<pvn:change>` elements and attributes such as `agent`, `person`, `organization`, `tool`, `timestamp`, `appliesTo`, and `intent`. Because a TM entry stored as described in this document is an ordinary XLIFF `<unit>`, it can carry `<pvn:provenance>` metadata exactly as any other XLIFF unit can.

This gives a translation memory consumer the ability to query stored entries by their provenance, for example to prefer entries produced by a specific translator or reviewed by a specific organization, to exclude machine-translated entries that were never reviewed by a person, or to filter by the date a translation was performed. Since provenance metadata is expressed using XLIFF elements and attributes rather than free-text `<prop>` values, as TMX requires, it can be validated and queried using standard XML tooling.

## 5.4 Example

A single translated document only ever has one `<file>`, so nothing about it shows translation memory *reuse*. The following example instead shows a TM store: an XLIFF document aggregating entries extracted from two unrelated projects, translated five months apart. The second project reuses a sentence already translated for the first, which is exactly the situation a translation memory exists to detect and exploit. Because both projects remain inside a single XLIFF document, each entry stays traceable to the `<file>` (and therefore the project) it came from, in the order it was added to the store, which a flat TMX `<tu>` list cannot represent.

```xml
<xliff version="2.3" srcLang="en" trgLang="es"
       xmlns="urn:oasis:names:tc:xliff:document:2.3"
       xmlns:pvn="urn:oasis:names:tc:xliff:pvn:2.3">
  <file id="f1" original="manual/chapter3.html">
    <unit id="tm-0001">
      <segment>
        <source>Your annual tax certificate is now available for download.</source>
        <target>Su certificado fiscal anual ya está disponible para descarga.</target>
      </segment>
    </unit>
    <unit id="tm-0002">
      <pvn:provenance>
        <pvn:change agent="Acme MT" appliesTo="target" timestamp="2026-01-15T10:15:00.000Z"/>
      </pvn:provenance>
      <segment>
        <source>Download your certificate before the end of the fiscal year.</source>
        <target>Descargue su certificado antes de que finalice el año fiscal.</target>
      </segment>
    </unit>
  </file>
  <file id="f2" original="app/ui-strings.json">
    <unit id="tm-1001">
      <pvn:provenance>
        <pvn:change agent="TM Reuse" appliesTo="target" timestamp="2026-06-30T09:02:00.000Z"
          intent="100% match reused from tm-0002 (manual/chapter3.html)."/>
      </pvn:provenance>
      <segment>
        <source>Download your certificate before the end of the fiscal year.</source>
        <target>Descargue su certificado antes de que finalice el año fiscal.</target>
      </segment>
    </unit>
    <unit id="tm-1002">
      <segment>
        <source>Your session will expire in five minutes.</source>
        <target>Su sesión caducará en cinco minutos.</target>
      </segment>
    </unit>
  </file>
</xliff>
```

Because `tm-1001` and `tm-0002` share the same `<source>` text, a TM consumer can find the reuse with a plain text comparison across the store, exactly as it would across a flat TMX file, then attribute that reuse using the Provenance module's `intent` attribute instead of a free-text TMX `<prop>`. And because both entries remain inside `<file>` elements that retain their own `original` attribute, the store also records which project each translation came from and in what order it was added, something a TMX export of the same two projects would have discarded.

---

# 6 Exchange of Multilingual Translation Memory Data

An XLIFF document is bilingual: it declares a single `srcLang` and a single `trgLang`. A translation memory, however, is often required to hold or exchange content across more than two languages. TMX addresses this within a single file, because a `<tu>` can hold any number of `<tuv>` elements, one per language.

This document recommends addressing the same requirement not by making an individual XLIFF document multilingual, which would be a departure from the XLIFF Core data model, but by packaging multiple bilingual XLIFF files together, one per source/target language pair, along with a manifest that identifies the relationship among them. This keeps every individual file fully conformant with, and processable by, any existing XLIFF 2.x tool, while still allowing a translation memory covering many languages to be exchanged as a single unit.

## 6.1 Package Structure

A translation memory exchange package is a ZIP archive (as defined in [ZIP APPNOTE]) with the following content:

- One or more bilingual XLIFF files, each conforming to [XLIFF-2.2-part2] or later, sharing a common `srcLang` and each declaring its own `trgLang`.
- A single manifest file, described in [6.2 Manifest File](#62-manifest-file), that lists the XLIFF files in the package and the language pair each one represents.

Corresponding translation units across the language-pair files in a package SHOULD use the same `<unit>` `id` value (and, where segmented, the same `<segment>` `id` value) so that a consumer can align entries for the same source content across target languages. This mirrors, at the package level, the alignment that a multilingual `<tu>` provides in a single TMX file.

## 6.2 Manifest File

The manifest is an XML file, named `manifest.xml`, placed at the root of the package. It lists each XLIFF file contained in the package together with its source and target language.

```xml
<tmPackage xmlns="urn:oasis:names:tc:xliff:tm-manifest:1.0" version="1.0">
  <file href="en-es.xlf" srcLang="en" trgLang="es"/>
  <file href="en-fr.xlf" srcLang="en" trgLang="fr"/>
  <file href="en-de.xlf" srcLang="en" trgLang="de"/>
</tmPackage>
```

*The manifest namespace, element and attribute names, and XML Schema shown above are provisional and subject to review by the OASIS XLIFF TC before this Note advances beyond Committee Note Draft.*

## 6.3 Example

A translation memory covering English source content with Spanish, French, and German target content would be packaged as:

```text
tm-package.zip
├── manifest.xml
├── en-es.xlf
├── en-fr.xlf
└── en-de.xlf
```

Each of `en-es.xlf`, `en-fr.xlf`, and `en-de.xlf` is an ordinary bilingual XLIFF document as described in [5 XLIFF as a Translation Memory Format](#5-xliff-as-a-translation-memory-format), and each can be consumed independently by a tool that only needs one language pair, or together by a tool that reads `manifest.xml` to reconstruct the full multilingual set.

---

# 7 Safety, Security, and Data Protection Considerations

Translation memory content frequently originates from source documents that were never intended for public redistribution, and may contain personal data or confidential business information carried over from the original text. Storing that content as plain XLIFF, rather than as an opaque TM database, does not change its sensitivity; implementers SHOULD apply the same access controls, storage protections, and redistribution policies to XLIFF-based TM files and packages as they would to any other document containing the same source content.

The Provenance module attributes described in [5.3 Provenance Metadata for Translation Memory Entries](#53-provenance-metadata-for-translation-memory-entries), in particular `person`, can themselves constitute personal data about the translators and reviewers who worked on the content. Implementers SHOULD consider applicable data protection requirements (such as consent and retention limits) before populating, storing, or exchanging `person` values in translation memory data, and MAY omit `person` in favor of `agent`, `organization`, or `tool` where individual identification is not required.

Translation memory exchange packages, as described in [6 Exchange of Multilingual Translation Memory Data](#6-exchange-of-multilingual-translation-memory-data), are ordinary ZIP archives. Implementations that unpack them SHOULD apply the same precautions recommended for processing any untrusted ZIP archive, including validating that archive entries do not escape the intended extraction directory (path traversal) and guarding against archives crafted to consume excessive disk space or memory when decompressed.

---

# 8 Conformance

## 8.1 Translation Memory Store

An XLIFF document **conforms** to this document as a *Translation Memory Store* if:

1. It is a conformant [XLIFF-2.2-part2] (or later) document.
2. Every stored translation memory entry is represented as an XLIFF `<unit>` containing one `<segment>` per entry, with `<source>` and, where a translation is available, `<target>` content, and no lossy conversion of inline content has been applied to represent that entry.
3. Where provenance information is recorded for an entry, it is expressed using the XLIFF 2.3 Provenance module rather than free-text notes or properties.

## 8.2 Translation Memory Exchange Package

A ZIP archive **conforms** to this document as a *Translation Memory Exchange Package* if:

1. It contains a `manifest.xml` file at its root, as described in [6.2 Manifest File](#62-manifest-file).
2. Every XLIFF file listed in the manifest is present in the archive and conforms to this document as a Translation Memory Store.
3. Every XLIFF file listed in the manifest declares a single `srcLang` and a single `trgLang`, matching the language pair recorded for that file in the manifest.

---

# Annex A License, Document Status and Notices

(This annex forms an integral part of this document.)

## A.1 Document Status

This document was last revised or approved by the OASIS XLIFF TC on the above date. The level of approval is also listed above. Check the "Latest version" location noted above for possible later revisions of this document. Any other numbered Versions and other technical work produced by the Technical Committee (TC) are listed at [https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=3d0f1f56-8477-4b53-9b14-018dc7d3eecf#technical](https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=3d0f1f56-8477-4b53-9b14-018dc7d3eecf#technical).

TC members should send comments on this document to the TC's email list. Others should send comments to the TC's public comment list, after subscribing to it by following the comment instructions at the TC's comments list web page at [https://www.oasis-open.org/committees/comments/index.php?wg_abbrev=xliff](https://www.oasis-open.org/committees/comments/index.php?wg_abbrev=xliff)

## A.2 License and Notices

Copyright © OASIS Open 202[ 5 ]. All Rights Reserved.

All capitalized terms in the following text have the meanings assigned to them in the OASIS Intellectual Property Rights Policy (the "OASIS IPR Policy"). The full Policy, which governs the licensure of this document, may be found at the OASIS website: [https://www.oasis-open.org/policies-guidelines/ipr/]

This document and translations of it may be copied and furnished to others, and derivative works that comment on or otherwise explain it or assist in its implementation may be prepared, copied, published, and distributed, in whole or in part, without restriction of any kind, provided that the above copyright notice and this section are included on all such copies and derivative works. However, this document itself may not be modified in any way, including by removing the copyright notice or references to OASIS, except as needed for the purpose of developing any document or deliverable produced by an OASIS Technical Committee (in which case the rules applicable to copyrights, as set forth in the OASIS IPR Policy, must be followed) or as required to translate it into languages other than English.

The limited permissions granted above are perpetual and will not be revoked by OASIS or its successors or assigns, as provided in the OASIS IPR Policy.

This document and the information contained herein is provided on an "AS IS" basis and OASIS DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION HEREIN WILL NOT INFRINGE ANY OWNERSHIP RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. OASIS AND ITS MEMBERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THIS DOCUMENT OR ANY PART THEREOF.

The name "OASIS" is a trademark of OASIS, the owner and developer of this document, and should be used only to refer to the organization and its official outputs. OASIS welcomes reference to, and implementation and use of, its documents, while reserving the right to enforce its marks against misleading uses. Please see [https://www.oasis-open.org/policies-guidelines/trademark/] for guidance.

---

# Annex B References

(This annex forms an integral part of this document.)

This section contains the informative references that are used in this document.

Informative references are either specific or non-specific. For specific references, only the cited version applies. For non-specific references, the latest version of the reference document (including any amendments) applies. While any hyperlinks included in this section were valid at the time of publication, OASIS cannot guarantee their long term validity.

## B.1 Normative References

**[XLIFF-2.2-part2]** XLIFF Version 2.2 Part 2: Extended. Edited by Rodolfo M. Raya and Lucía Morado Vázquez. 13 March 2025. OASIS Committee Specification. [https://docs.oasis-open.org/xliff/xliff-core/v2.2/xliff-v2.2-part2-extended.html](https://docs.oasis-open.org/xliff/xliff-core/v2.2/xliff-v2.2-part2-extended.html).

**[RFC2119]** S. Bradner. *Key words for use in RFCs to Indicate Requirement Levels*. March 1997. [https://www.rfc-editor.org/rfc/rfc2119](https://www.rfc-editor.org/rfc/rfc2119).

**[ZIP APPNOTE]** PKWARE, Inc. *.ZIP File Format Specification*. [https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT).

## B.2 Informative References

The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

**[TMX 1.4b]** Translation Memory eXchange (TMX) Version 1.4b. Edited by Yves Savourel. OSCAR Recommendation, 26 April 2005. [https://web.archive.org/web/20060528180452/http://www.lisa.org/standards/tmx/tmx.html](https://web.archive.org/web/20060528180452/http://www.lisa.org/standards/tmx/tmx.html).

**[XLIFF-2.3-provenance]** XLIFF Version 2.3 Provenance Module (Work in Progress). OASIS XLIFF Technical Committee. Not yet published; referenced here for context while under development in the same working repository as this document.

---

# Annex C Additional Annex as Needed

(This annex forms an integral part of this document.)

## C.1 Subsection Title

### C.1.1 Sub-subsection

---

# Appendix 1 Acknowledgments

(This appendix does not form an integral part of this document and is informational.)

## Leadership

The following individuals have had significant leadership positions during the development of this document, not just this version of the document, and they are gratefully acknowledged:

- Chairs
  - Dr. Lucía Morado Vázquez, [University of Geneva](https://www.unige.ch/en/)
  - Yoshito Umaoka, Individual

- Secretaries
  - Rodolfo M. Raya, [Maxprograms](https://maxprograms.com)

- Editors
  - Rodolfo M. Raya, [Maxprograms](https://maxprograms.com)

## Special Thanks

The following individuals have made substantial contributions to this document, not just this version of the document, and their contributions are gratefully acknowledged:

- Mihai Niță, [Google LLC](https://www.google.com/)
- Mathijs Sonnemans, Individual

## Participants

The following individuals were members of this committee during the creation of this document, not just this version of the document, and their contributions are gratefully acknowledged:

- First Name Last Name, Company

---

# Appendix 2 Changes From Previous Version

(This appendix does not form an integral part of this document and is informational.)

\<

The appendix **SHOULD** contain any explanatory text about the reason for this version including any major changes. The level of detail that is included in this appendix is up to the editors and chairs of the TC to determine. This appendix is **REQUIRED**, if there are no changes then one is to put "None." In addition to any descriptive text, all major changes **SHOULD** be in a bulleted list so that reviewers and implementers can easily understand what they need to know.

\>

- Change 1  
- Change 2

## Revision History

- \< Date in yyyy-mm-dd format \>, \< Revision number \>  
- \< Date in yyyy-mm-dd format \>, \< Revision number \>

---

# Appendix 3 Additional Appendix as Needed

(This appendix does not form an integral part of this document and is informational.)

## Subsection Title

### Sub-subsection

\< The following centered line represents the end of the document \>  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
