Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E96199C27
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 18:53:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A2C724BA1;
	Tue, 31 Mar 2020 16:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4MtYAuITALD; Tue, 31 Mar 2020 16:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C28E5227FF;
	Tue, 31 Mar 2020 16:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B4E2C07FF;
	Tue, 31 Mar 2020 16:53:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC7E3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 16:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A6829886AA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 16:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QswW3SAAS4LO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 16:53:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2601588689
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 16:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR2e8Juy8BBFdYYWsQr2LwgLq3p4jg+ipTkHBwK9Dq5p3M2AIkYwK09IO5WbFMjLHyHmvG+t7v8/A47BipiKqEZhxrgqCDhJq3CiX/v00IfS3Kw/ZakQC8Zb7wsgxuhXchwRbshvwPbxeaokwGFJvrfeim3FcoXiD88bjbKlfZClGveSrhCoXXvrfGzcOxdGrBbjZPDR89kbsljv/8iIj1SpI/Mg40WbZ8zPfNbhZrAIz/aEpXT3Bh2KmG60O2zKmhKhovxexd/nH4VqQe71oMl0I22NDFvj57T6W9ei1OQBsvaNOM6GCC+du46NYlQYgs0Qn+aWdOhoRqbKVsl/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6X2klDaI5s2HpqRZCU18HamNh9V1/ZjIhHAckmq4ko=;
 b=dVOgQiQtSr5Y5IaxL0Bx3jvqNWK3k1cj/j7EdWfVWXN6vLkGO/E73neBDRyqnAYSEVn8ERv6gDZhbfHNa6FOwte+y3xkNq3N/qG59KnXjDEOANJZg8BL3P0Z5W30EASv0qAZ2t6iMCiO9mfOxihNJuEdWO2E2cmBD3GeFKu5ezinNOaj3zdHNf07QTIwAFB5Jki5ju/WUavn8AU8lgaIIdR8dHwxEet7Bq/FF04AlMDuqOQMDfUWgMTJEhWoyxsr9bjwSVS8HorL1+oJZ9q0gROHOvfCoDlK+JgE7A9Tj1t0kMjHarbch4oEPfIBzOFcpjP15BfzIzUkhXCMCQIViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6X2klDaI5s2HpqRZCU18HamNh9V1/ZjIhHAckmq4ko=;
 b=NkBKgMZBqaSy1VaPV3JU9/XDSqjrKUyxwEN0qySV3D8jgNgqI5/ZPw5DCE6u048At9iJ0OjP80MZdkwfFA/vQ0iw9JtMdytLhOy/WUuZYEJKw/MPvOQ/vb7oe1ctRn6nCvVGgKbh2NlgRbdkQ6KgacU46FamX+q+3y/pfjdSOVE=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (2603:10b6:a03:4a::18)
 by BYAPR05MB4344.namprd05.prod.outlook.com (2603:10b6:a02:f1::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.13; Tue, 31 Mar
 2020 16:37:45 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::7c65:25af:faf7:5331]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::7c65:25af:faf7:5331%2]) with mapi id 15.20.2878.014; Tue, 31 Mar 2020
 16:37:45 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER to
 handle THP spilt issue
Thread-Topic: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Thread-Index: AQHV+ELbJxXcLTs5FEiRY3DW9nrWzKhEomsAgAACs4CAAAEugIAV50IAgAAJXACAACBZgIAH6GMAgAAvR4CAAAIWgIAAAXUAgAAHRACAAAELAIAAANOAgAApSAA=
Date: Tue, 31 Mar 2020 16:37:44 +0000
Message-ID: <BABD09DC-217E-4F00-9C05-74ABB4B1E13D@vmware.com>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
 <20200331100359-mutt-send-email-mst@kernel.org>
 <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
In-Reply-To: <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [2601:647:4700:9b2:4568:145a:b450:27e3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97cf9b61-e164-4ee5-045e-08d7d591d705
x-ms-traffictypediagnostic: BYAPR05MB4344:
x-microsoft-antispam-prvs: <BYAPR05MB43446CD9865DCBD697364283D0C80@BYAPR05MB4344.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB4776.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(316002)(7416002)(36756003)(66946007)(6916009)(478600001)(33656002)(71200400001)(6486002)(53546011)(8936002)(86362001)(6512007)(76116006)(66446008)(2616005)(81166006)(2906002)(8676002)(186003)(4326008)(64756008)(5660300002)(81156014)(6506007)(54906003)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YvzubaMvqiGynuNlRYNmaIhB2MnGrRjnhTqghBu7fgdEQVa9t21tWJgw9Wkhkl09PWaft6UqsrD7TbGJjrhTpsg4IMRvcpE0oluRvi1oFr7iSB87kdSYCWE/ATq9Hzg0hugfDQSO5xzw2OVujE7yD7+7AbdufK/eGi10wVSDs5EmtY1P+LZm2/Ui3cOJG3Yn+pnRm8jNboZ1YCbwBUZcDAgLJN/rlm+DPBYe5lJXotYnQLSEs7+fYmhFED44JEiGK2SDQG5ls6PXQc7qFHSr67FkxY7wUlBeIBSmbqH/DBxWxUr4Px+NR9wRAUSP+YvJxqZBzW+UxUIfzioxqOCzE+DI04DEHJXFPe3tH3s62kNyyqSFHHDaXgGKL6ncOViB/BOttTVf9fTds++lyD5C+iityZ5SPM8B+61V1wbNQE/qYHoFzlDVmmZgs9mpOB64
x-ms-exchange-antispam-messagedata: OS7Sovxnd7QHddQpGsR/kFqS9W6pniJXKIoHqjY6plmnECNCulfUqtd7DqdhWZDDM4n43oXbGLSlHKBOvY4XIr9aMDlaKXiSdXZ9Lb3AdQxhAcVHQB+9IdW6UmxwcJoRuG/SLTxETvBpc1hwEyhgfqmOzuz1Kpk7c2NaqhC7moDjquHwUeblXP/+D0GH6HasvZQvxrdXNKa4NqbwIDgQOA==
x-ms-exchange-transport-forked: True
Content-ID: <21176E85C416AC4BB4C87D98E5352CA3@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cf9b61-e164-4ee5-045e-08d7d591d705
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 16:37:44.8909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pysYBZ/Xe7+DO0b+R64eFbTZJOxJTFzEcqCuLk4EF8ScUip8qTVJWIj9yVauwZXI8oMDCwurTZgfIxsM6idTpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4344
Cc: "pagupta@redhat.com" <pagupta@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "mojha@codeaurora.org" <mojha@codeaurora.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LKML <linux-kernel@vger.kernel.org>, Hui Zhu <teawaterz@linux.alibaba.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hui Zhu <teawater@gmail.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

PiBPbiBNYXIgMzEsIDIwMjAsIGF0IDc6MDkgQU0sIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDMxLjAzLjIwIDE2OjA3LCBNaWNoYWVsIFMuIFRz
aXJraW4gd3JvdGU6DQo+PiBPbiBUdWUsIE1hciAzMSwgMjAyMCBhdCAwNDowMzoxOFBNICswMjAw
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4+PiBPbiAzMS4wMy4yMCAxNTozNywgTWljaGFl
bCBTLiBUc2lya2luIHdyb3RlOg0KPj4+PiBPbiBUdWUsIE1hciAzMSwgMjAyMCBhdCAwMzozMjow
NVBNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4+Pj4+IE9uIDMxLjAzLjIwIDE1
OjI0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+Pj4+Pj4gT24gVHVlLCBNYXIgMzEsIDIw
MjAgYXQgMTI6MzU6MjRQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+Pj4+Pj4+
IE9uIDI2LjAzLjIwIDEwOjQ5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+Pj4+Pj4+PiBP
biBUaHUsIE1hciAyNiwgMjAyMCBhdCAwODo1NDowNEFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFu
ZCB3cm90ZToNCj4+Pj4+Pj4+Pj4gQW0gMjYuMDMuMjAyMCB1bSAwODoyMSBzY2hyaWViIE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Og0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4g
77u/T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6NTE6MjVBTSArMDEwMCwgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4gT24gMTIuMDMuMjAgMDk6NDcsIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToNCj4+Pj4+Pj4+Pj4+PiBPbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAwOToz
NzozMkFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4gMi4g
WW91IGFyZSBlc3NlbnRpYWxseSBzdGVhbGluZyBUSFBzIGluIHRoZSBndWVzdC4gU28gdGhlIGZh
c3Rlc3QNCj4+Pj4+Pj4+Pj4+Pj4gbWFwcGluZyAoVEhQIGluIGd1ZXN0IGFuZCBob3N0KSBpcyBn
b25lLiBUaGUgZ3Vlc3Qgd29uJ3QgYmUgYWJsZSB0byBtYWtlDQo+Pj4+Pj4+Pj4+Pj4+IHVzZSBv
ZiBUSFAgd2hlcmUgaXQgcHJldmlvdXNseSB3YXMgYWJsZSB0by4gSSBjYW4gaW1hZ2luZSB0aGlz
IGltcGxpZXMgYQ0KPj4+Pj4+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBmb3Igc29t
ZSB3b3JrbG9hZHMuIFRoaXMgbmVlZHMgYSBwcm9wZXINCj4+Pj4+Pj4+Pj4+Pj4gcGVyZm9ybWFu
Y2UgZXZhbHVhdGlvbi4NCj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiBJIHRoaW5rIHRoZSBw
cm9ibGVtIGlzIG1vcmUgd2l0aCB0aGUgYWxsb2NfcGFnZXMgQVBJLg0KPj4+Pj4+Pj4+Pj4+IFRo
YXQgZ2l2ZXMgeW91IGV4YWN0bHkgdGhlIGdpdmVuIG9yZGVyLCBhbmQgaWYgdGhlcmUncw0KPj4+
Pj4+Pj4+Pj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJsZSwgaXQgd2lsbCBzcGxpdCBpdCB1cC4N
Cj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiBCdXQgZm9yIGJhbGxvb24gLSBJIHN1c3BlY3Qg
bG90cyBvZiBvdGhlciB1c2VycywNCj4+Pj4+Pj4+Pj4+PiB3ZSBkbyBub3Qgd2FudCB0byBzdHJl
c3MgdGhlIHN5c3RlbSBidXQgaWYgYSBsYXJnZQ0KPj4+Pj4+Pj4+Pj4+IGNodW5rIGlzIGF2YWls
YWJsZSBhbnl3YXksIHRoZW4gd2UgY291bGQgaGFuZGxlDQo+Pj4+Pj4+Pj4+Pj4gdGhhdCBtb3Jl
IG9wdGltYWxseSBieSBnZXR0aW5nIGl0IGFsbCBpbiBvbmUgZ28uDQo+Pj4+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4gU28gaWYgd2Ugd2FudCB0byBhZGRyZXNzIHRoaXMs
IElNSE8gdGhpcyBjYWxscyBmb3IgYSBuZXcgQVBJLg0KPj4+Pj4+Pj4+Pj4+IEFsb25nIHRoZSBs
aW5lcyBvZg0KPj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+ICAgc3RydWN0IHBhZ2UgKmFsbG9j
X3BhZ2VfcmFuZ2UoZ2ZwX3QgZ2ZwLCB1bnNpZ25lZCBpbnQgbWluX29yZGVyLA0KPj4+Pj4+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfb3JkZXIsIHVuc2lnbmVkIGlu
dCAqb3JkZXIpDQo+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4gdGhlIGlkZWEgd291bGQgdGhl
biBiZSB0byByZXR1cm4gYXQgYSBudW1iZXIgb2YgcGFnZXMgaW4gdGhlIGdpdmVuDQo+Pj4+Pj4+
Pj4+Pj4gcmFuZ2UuDQo+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4gV2hhdCBkbyB5b3UgdGhp
bms/IFdhbnQgdG8gdHJ5IGltcGxlbWVudGluZyB0aGF0Pw0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4+PiBZb3UgY2FuIGp1c3Qgc3RhcnQgd2l0aCB0aGUgaGlnaGVzdCBvcmRlciBhbmQgZGVjcmVt
ZW50IHRoZSBvcmRlciB1bnRpbA0KPj4+Pj4+Pj4+Pj4geW91ciBhbGxvY2F0aW9uIHN1Y2NlZWRz
IHVzaW5nIGFsbG9jX3BhZ2VzKCksIHdoaWNoIHdvdWxkIGJlIGVub3VnaCBmb3INCj4+Pj4+Pj4+
Pj4+IGEgZmlyc3QgdmVyc2lvbi4gQXQgbGVhc3QgSSBkb24ndCBzZWUgdGhlIGltbWVkaWF0ZSBu
ZWVkIGZvciBhIG5ldw0KPj4+Pj4+Pj4+Pj4ga2VybmVsIEFQSS4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4+IE9LIEkgcmVtZW1iZXIgbm93LiAgVGhlIHByb2JsZW0gaXMgd2l0aCByZWNsYWltLiBV
bmxlc3MgcmVjbGFpbSBpcw0KPj4+Pj4+Pj4+PiBjb21wbGV0ZWx5IGRpc2FibGVkLCBhbnkgb2Yg
dGhlc2UgY2FsbHMgY2FuIHNsZWVwLiBBZnRlciBpdCB3YWtlcyB1cCwNCj4+Pj4+Pj4+Pj4gd2Ug
d291bGQgbGlrZSB0byBnZXQgdGhlIGxhcmdlciBvcmRlciB0aGF0IGhhcyBiZWNvbWUgYXZhaWxh
YmxlDQo+Pj4+Pj4+Pj4+IG1lYW53aGlsZS4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBZZXMsIGJ1
dCB0aGF04oCYcyBhIHB1cmUgb3B0aW1pemF0aW9uIElNSE8uDQo+Pj4+Pj4+Pj4gU28gSSB0aGlu
ayB3ZSBzaG91bGQgZG8gYSB0cml2aWFsIGltcGxlbWVudGF0aW9uIGZpcnN0IGFuZCB0aGVuIHNl
ZSB3aGF0IHdlIGdhaW4gZnJvbSBhIG5ldyBhbGxvY2F0b3IgQVBJLiBUaGVuIHdlIG1pZ2h0IGFs
c28gYmUgYWJsZSB0byBqdXN0aWZ5IGl0IHVzaW5nIHJlYWwgbnVtYmVycy4NCj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4gV2VsbCBob3cgZG8geW91IHByb3Bvc2UgaW1wbGVtZW50IHRoZSBuZWNlc3Nhcnkg
c2VtYW50aWNzPw0KPj4+Pj4+Pj4gSSB0aGluayB3ZSBhcmUgYm90aCBhZ3JlZWQgdGhhdCBhbGxv
Y19wYWdlX3JhbmdlIGlzIG1vcmUgb3INCj4+Pj4+Pj4+IGxlc3Mgd2hhdCdzIG5lY2Vzc2FyeSBh
bnl3YXkgLSBzbyBob3cgd291bGQgeW91IGFwcHJveGltYXRlIGl0DQo+Pj4+Pj4+PiBvbiB0b3Ag
b2YgZXhpc3RpbmcgQVBJcz8NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmFs
bG9vbl9jb21wYWN0aW9uLmggYi9pbmNsdWRlL2xpbnV4L2JhbGxvb25fY29tcGFjdGlvbi5oDQo+
Pj4+IA0KPj4+PiAuLi4uLg0KPj4+PiANCj4+Pj4gDQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9i
YWxsb29uX2NvbXBhY3Rpb24uYyBiL21tL2JhbGxvb25fY29tcGFjdGlvbi5jDQo+Pj4+Pj4+IGlu
ZGV4IDI2ZGUwMjBhYWU3Yi4uMDY3ODEwYjMyODEzIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9tbS9i
YWxsb29uX2NvbXBhY3Rpb24uYw0KPj4+Pj4+PiArKysgYi9tbS9iYWxsb29uX2NvbXBhY3Rpb24u
Yw0KPj4+Pj4+PiBAQCAtMTEyLDIzICsxMTIsMzUgQEAgc2l6ZV90IGJhbGxvb25fcGFnZV9saXN0
X2RlcXVldWUoc3RydWN0IGJhbGxvb25fZGV2X2luZm8gKmJfZGV2X2luZm8sDQo+Pj4+Pj4+IEVY
UE9SVF9TWU1CT0xfR1BMKGJhbGxvb25fcGFnZV9saXN0X2RlcXVldWUpOw0KPj4+Pj4+PiANCj4+
Pj4+Pj4gLyoNCj4+Pj4+Pj4gLSAqIGJhbGxvb25fcGFnZV9hbGxvYyAtIGFsbG9jYXRlcyBhIG5l
dyBwYWdlIGZvciBpbnNlcnRpb24gaW50byB0aGUgYmFsbG9vbg0KPj4+Pj4+PiAtICoJCQlwYWdl
IGxpc3QuDQo+Pj4+Pj4+ICsgKiBiYWxsb29uX3BhZ2VzX2FsbG9jIC0gYWxsb2NhdGVzIGEgbmV3
IHBhZ2UgKG9mIGF0IG1vc3QgdGhlIGdpdmVuIG9yZGVyKQ0KPj4+Pj4+PiArICogCQkJIGZvciBp
bnNlcnRpb24gaW50byB0aGUgYmFsbG9vbiBwYWdlIGxpc3QuDQo+Pj4+Pj4+ICAqDQo+Pj4+Pj4+
ICAqIERyaXZlciBtdXN0IGNhbGwgdGhpcyBmdW5jdGlvbiB0byBwcm9wZXJseSBhbGxvY2F0ZSBh
IG5ldyBiYWxsb29uIHBhZ2UuDQo+Pj4+Pj4+ICAqIERyaXZlciBtdXN0IGNhbGwgYmFsbG9vbl9w
YWdlX2VucXVldWUgYmVmb3JlIGRlZmluaXRpdmVseSByZW1vdmluZyB0aGUgcGFnZQ0KPj4+Pj4+
PiAgKiBmcm9tIHRoZSBndWVzdCBzeXN0ZW0uDQo+Pj4+Pj4+ICAqDQo+Pj4+Pj4+ICsgKiBXaWxs
IGZhbGwgYmFjayB0byBzbWFsbGVyIG9yZGVycyBpZiBhbGxvY2F0aW9uIGZhaWxzLiBUaGUgb3Jk
ZXIgb2YgdGhlDQo+Pj4+Pj4+ICsgKiBhbGxvY2F0ZWQgcGFnZSBpcyBzdG9yZWQgaW4gcGFnZS0+
cHJpdmF0ZS4NCj4+Pj4+Pj4gKyAqDQo+Pj4+Pj4+ICAqIFJldHVybjogc3RydWN0IHBhZ2UgZm9y
IHRoZSBhbGxvY2F0ZWQgcGFnZSBvciBOVUxMIG9uIGFsbG9jYXRpb24gZmFpbHVyZS4NCj4+Pj4+
Pj4gICovDQo+Pj4+Pj4+IC1zdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdlX2FsbG9jKHZvaWQpDQo+
Pj4+Pj4+ICtzdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdlc19hbGxvYyhpbnQgb3JkZXIpDQo+Pj4+
Pj4+IHsNCj4+Pj4+Pj4gLQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IGFsbG9jX3BhZ2UoYmFsbG9vbl9t
YXBwaW5nX2dmcF9tYXNrKCkgfA0KPj4+Pj4+PiAtCQkJCSAgICAgICBfX0dGUF9OT01FTUFMTE9D
IHwgX19HRlBfTk9SRVRSWSB8DQo+Pj4+Pj4+IC0JCQkJICAgICAgIF9fR0ZQX05PV0FSTik7DQo+
Pj4+Pj4+IC0JcmV0dXJuIHBhZ2U7DQo+Pj4+Pj4+ICsJc3RydWN0IHBhZ2UgKnBhZ2U7DQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gKwl3aGlsZSAob3JkZXIgPj0gMCkgew0KPj4+Pj4+PiArCQlwYWdlID0g
YWxsb2NfcGFnZXMoYmFsbG9vbl9tYXBwaW5nX2dmcF9tYXNrKCkgfA0KPj4+Pj4+PiArCQkJCSAg
IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwNCj4+Pj4+Pj4gKwkJCQkgICBfX0dG
UF9OT1dBUk4sIG9yZGVyKTsNCj4+Pj4+Pj4gKwkJaWYgKHBhZ2UpIHsNCj4+Pj4+Pj4gKwkJCXNl
dF9wYWdlX3ByaXZhdGUocGFnZSwgb3JkZXIpOw0KPj4+Pj4+PiArCQkJcmV0dXJuIHBhZ2U7DQo+
Pj4+Pj4+ICsJCX0NCj4+Pj4+Pj4gKwkJb3JkZXItLTsNCj4+Pj4+Pj4gKwl9DQo+Pj4+Pj4+ICsJ
cmV0dXJuIE5VTEw7DQo+Pj4+Pj4+IH0NCj4+Pj4+Pj4gLUVYUE9SVF9TWU1CT0xfR1BMKGJhbGxv
b25fcGFnZV9hbGxvYyk7DQo+Pj4+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2Vz
X2FsbG9jKTsNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IC8qDQo+Pj4+Pj4+ICAqIGJhbGxvb25fcGFnZV9l
bnF1ZXVlIC0gaW5zZXJ0cyBhIG5ldyBwYWdlIGludG8gdGhlIGJhbGxvb24gcGFnZSBsaXN0Lg0K
Pj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IEkgdGhpbmsgdGhpcyB3aWxsIHRyeSB0byBpbnZva2Ug
ZGlyZWN0IHJlY2xhaW0gZnJvbSB0aGUgZmlyc3QgaXRlcmF0aW9uDQo+Pj4+Pj4gdG8gZnJlZSB1
cCB0aGUgbWF4IG9yZGVyLg0KPj4+Pj4gDQo+Pj4+PiAlX19HRlBfTk9SRVRSWTogVGhlIFZNIGlt
cGxlbWVudGF0aW9uIHdpbGwgdHJ5IG9ubHkgdmVyeSBsaWdodHdlaWdodA0KPj4+Pj4gbWVtb3J5
IGRpcmVjdCByZWNsYWltIHRvIGdldCBzb21lIG1lbW9yeSB1bmRlciBtZW1vcnkgcHJlc3N1cmUg
KHRodXMgaXQNCj4+Pj4+IGNhbiBzbGVlcCkuIEl0IHdpbGwgYXZvaWQgZGlzcnVwdGl2ZSBhY3Rp
b25zIGxpa2UgT09NIGtpbGxlci4NCj4+Pj4+IA0KPj4+Pj4gQ2VydGFpbmx5IGdvb2QgZW5vdWdo
IGZvciBhIGZpcnN0IHZlcnNpb24gSSB3b3VsZCBzYXksIG5vPw0KPj4+PiANCj4+Pj4gRnJhbmts
eSBob3cgd2VsbCB0aGF0IGJlaGF2ZXMgd291bGQgZGVwZW5kIGEgbG90IG9uIHRoZSB3b3JrbG9h
ZC4NCj4+Pj4gQ2FuIHJlZ3Jlc3MganVzdCBhcyB3ZWxsLg0KPj4+PiANCj4+Pj4gRm9yIHRoZSAx
c3QgdmVyc2lvbiBJJ2QgcHJlZmVyIHNvbWV0aGluZyB0aGF0IGlzIHRoZSBsZWFzdCBkaXNydXB0
aXZlLA0KPj4+PiBhbmQgdGhhdCBJTUhPIG1lYW5zIHdlIG9ubHkgdHJpZ2dlciByZWNsYWltIGF0
IGFsbCBpbiB0aGUgc2FtZSBjb25maWd1cmF0aW9uDQo+Pj4+IGFzIG5vdyAtIHdoZW4gd2UgY2Fu
J3Qgc2F0aXNmeSB0aGUgbG93ZXN0IG9yZGVyIGFsbG9jYXRpb24uDQo+Pj4gDQo+Pj4gQWdyZWVk
Lg0KPj4+IA0KPj4+PiBBbnl0aGluZyBlbHNlIHdvdWxkIGJlIGEgaHVnZSBhbW91bnQgb2YgdGVz
dGluZyB3aXRoIGFsbCBraW5kIG9mDQo+Pj4+IHdvcmtsb2Fkcy4NCj4+PiANCj4+PiBTbyBkb2lu
ZyBhICImIH5fX0dGUF9SRUNMQUlNIiBpbiBjYXNlIG9yZGVyID4gMD8gKGFzIGRvbmUgaW4NCj4+
PiBHRlBfVFJBTlNIVUdFX0xJR0hUKQ0KPj4gDQo+PiBUaGF0IHdpbGwgaW1wcm92ZSB0aGUgc2l0
dWF0aW9uIHdoZW4gcmVjbGFpbSBpcyBub3QgbmVlZGVkLCBidXQgbGVhdmUNCj4+IHRoZSBwcm9i
bGVtIGluIHBsYWNlIGZvciB3aGVuIGl0J3MgbmVlZGVkOiBpZiByZWNsYWltIGRvZXMgdHJpZ2dl
ciwgd2UNCj4+IGNhbiBnZXQgYSBodWdlIGZyZWUgcGFnZSBhbmQgaW1tZWRpYXRlbHkgYnJlYWsg
aXQgdXAuDQo+PiANCj4+IFNvIGl0J3Mgb2sgYXMgYSBmaXJzdCBzdGVwIGJ1dCBpdCB3aWxsIG1h
a2UgdGhlIHNlY29uZCBzdGVwIGhhcmRlciBhcw0KPj4gd2UnbGwgbmVlZCB0byB0ZXN0IHdpdGgg
cmVjbGFpbSA6KS4NCj4gDQo+IEkgZXhwZWN0IHRoZSB3aG9sZSAic3RlYWwgaHVnZSBwYWdlcyBm
cm9tIHlvdXIgZ3Vlc3QiIHRvIGJlIHByb2JsZW1hdGljLA0KPiBhcyBJIGFscmVhZHkgbWVudGlv
bmVkIHRvIEFsZXguIFRoaXMgbmVlZHMgYSBwZXJmb3JtYW5jZSBldmFsdWF0aW9uLg0KPiANCj4g
VGhpcyBhbGwgc21lbGxzIGxpa2UgYSBsb3Qgb2Ygd29ya2xvYWQgZGVwZW5kZW50IGZpbmUtdHVu
aW5nLiA6KQ0KDQpBRkFJSyB0aGUgaGFyZHdhcmUgb3ZlcmhlYWRzIG9mIGtlZXBpbmcgaHVnZS1w
YWdlcyBpbiB0aGUgZ3Vlc3QgYW5kIGJhY2tpbmcNCnRoZW0gd2l0aCA0S0IgcGFnZXMgYXJlIG5v
bi1uZWdsaWdpYmxlLiBEaWQgeW91IHRha2UgdGhvc2UgaW50byBhY2NvdW50Pw0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
