Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CD97FED
	for <lists.virtualization@lfdr.de>; Wed, 21 Aug 2019 18:23:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 971C7AF7;
	Wed, 21 Aug 2019 16:23:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2259FAD8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 16:23:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8C71F8A6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 16:23:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iPFzk8auU2TN2S9qug5sRsvDk7nt2AixohJVifMCMbNRWau9wISuEd0UdDwSd+lOoJkFSWnTTBMpy3fCl/I/0ZCdqjGzOAJCnZiCGmOIEH08ZWt7evDJhGC8iSdx9zsElDEXb/AFhXG+RBm6vliuW9TqEpaSuYCzv1VGType371k0EYxnyXsnJCzAHaiEebJHxtJy9yVLJ6bw1zRa5SHnC/ttfnL39JVfMT3cZeO5KQTwFvapOhASTyzsu49WtrIdzHXcRXr8Mxf31l8LOQDlLlRmi1G2za8M8M4DvBlNxz06hcGv8tpoz8H+7bGb+rHP97VH/JpFeVYyKnQ3+EMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I9tlPJtLZC99Tns9udnrluz2F9EERVnPcn7qiebsrQE=;
	b=YMKkq210jeK1xJcwwakmVXdKoBRc8tmc01FNwEDNht0BMOUbCnSQd2wSjqOUfB5A9u6OushanuSxP+GqEhKE44UWTt6czgTJmmbpimkPnbEjYzC+wYkpOqEmSk7CHDlGlC+J5JDHkA0T/+I38Dh8Qk4SLH/wSIJEK/HbPosJncVWYuJ6N9Kf6wwHjuSkS+3l7pDzPQ3D8pskLuZsSL9H41wtcC1Dpt7MqYUTDYWiQFWhTt68MfYEqW4yA4Hy7Ekh/a78wmUsPYhvuVEozdlacusL6NYOCUBSeA3VBSZiGffWk4vLRLqHYmVOLRSdTivBTuF25xpVagb/q9gOE1pzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I9tlPJtLZC99Tns9udnrluz2F9EERVnPcn7qiebsrQE=;
	b=AOd/sPDnClXQvtmU9My1HYwiLSbDRNX+0JCO152JpThQTQktdGVBx6BnU8w44f/nSTM0j/3y454V3u7J6hUEvCrrx5jGPDE7iZMyxWr71xAMN8PA+ER9VB52zuxPVoM5w1w8UPNDHRQ0M+xu8VWOi8r9hvEWlFOwmqyqnsFS1KE=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB5237.namprd05.prod.outlook.com (20.177.231.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.11; Wed, 21 Aug 2019 16:23:22 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376%5]) with mapi id 15.20.2199.011;
	Wed, 21 Aug 2019 16:23:22 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/balloon_compaction: suppress allocation warnings
Thread-Topic: [PATCH] mm/balloon_compaction: suppress allocation warnings
Thread-Index: AQHVV3WT44k5kIt6JEiYnWTDWJ3OpKcFxbMAgAAE4IA=
Date: Wed, 21 Aug 2019 16:23:22 +0000
Message-ID: <5BBC6CB3-2DCD-4A95-90C9-7C23482F9B32@vmware.com>
References: <20190820091646.29642-1-namit@vmware.com>
	<ba01ec8c-19c3-847c-a315-2f70f4b1fe31@redhat.com>
In-Reply-To: <ba01ec8c-19c3-847c-a315-2f70f4b1fe31@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ab1e096-5beb-4c96-e3c5-08d72653e2e2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR05MB5237; 
x-ms-traffictypediagnostic: BYAPR05MB5237:
x-microsoft-antispam-prvs: <BYAPR05MB523742FCCE03F64596033B5AD0AA0@BYAPR05MB5237.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(3846002)(6116002)(33656002)(14454004)(478600001)(316002)(6246003)(66066001)(6916009)(25786009)(53936002)(305945005)(7736002)(36756003)(66446008)(2906002)(4326008)(64756008)(66556008)(66476007)(5660300002)(66946007)(6512007)(8936002)(6486002)(54906003)(76116006)(476003)(2616005)(446003)(86362001)(99286004)(14444005)(486006)(71190400001)(71200400001)(8676002)(81156014)(81166006)(229853002)(6506007)(102836004)(53546011)(186003)(76176011)(26005)(11346002)(256004)(6436002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB5237;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R748NA9GD0TV+rQ+LpypWiIwKXqTHGcXFoo3YnvoudfZnB5NgeSrkecA2xFUdZ1poHUIi7a1uBXKMh47DUbBzb0MSMRo8bPK9lxxfhwiDN8NoQLlmEVK2jSsb6ih5zaBPdHC8xHlkf7gNeyIIekI4knI0oKMl0TO+eX4TDhIRcOxkqKmWYDrNyB4zy4j1xwlvPau7/DMluciYkUMWm4zKr1ujTyyYSmw7G1t8M+1lmmhhz06j6KRDV6sS5poN81tVZNFRolFzzocCGO6YiF1wOrcpCc6uQx9bfziBYxRP6J6cXhRs6k8JgkzITozdfyIaRLx9kZ28IHj2zLY6hNDlt585t8y8NOpSrQgBOTxBMvV9aQsg8dmHT7IE8I8aQqJ9rvUEFH/kHo63lrqYlJYppFpWh5jP6rzqGFdjW0B94w=
x-ms-exchange-transport-forked: True
Content-ID: <A6726210375C704692078D756D10D1B3@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab1e096-5beb-4c96-e3c5-08d72653e2e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 16:23:22.5316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRdCV6qpuhm0WxQz7a7hRGGXBR/2b9w/SlOdBhDKm0n6kX9LIuZ1712eOHEI1KF5jdLA7S9WUwymYjR7zy3RSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5237
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

PiBPbiBBdWcgMjEsIDIwMTksIGF0IDk6MDUgQU0sIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIwLjA4LjE5IDExOjE2LCBOYWRhdiBBbWl0IHdy
b3RlOg0KPj4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIHByaW50IHdhcm5pbmdzIHdoZW4gYmFsbG9v
biBwYWdlIGFsbG9jYXRpb24gZmFpbHMsDQo+PiBhcyB0aGV5IGFyZSBleHBlY3RlZCBhbmQgY2Fu
IGJlIGhhbmRsZWQgZ3JhY2VmdWxseS4gIFNpbmNlIFZNd2FyZQ0KPj4gYmFsbG9vbiBub3cgdXNl
cyBiYWxsb29uLWNvbXBhY3Rpb24gaW5mcmFzdHJ1Y3R1cmUsIGFuZCBzdXBwcmVzc2VkIHRoZXNl
DQo+PiB3YXJuaW5ncyBiZWZvcmUsIGl0IGlzIGFsc28gYmVuZWZpY2lhbCB0byBzdXBwcmVzcyB0
aGVzZSB3YXJuaW5ncyB0bw0KPj4ga2VlcCB0aGUgc2FtZSBiZWhhdmlvciB0aGF0IHRoZSBiYWxs
b29uIGhhZCBiZWZvcmUuDQo+IA0KPiBJIGFtIG5vdCBzdXJlIGlmIHRoYXQncyBhIGdvb2QgaWRl
YS4gVGhlIGFsbG9jYXRpb24gd2FybmluZ3MgYXJlIHVzdWFsbHkNCj4gdGhlIG9ubHkgdHJhY2Ug
b2YgInRoZSB1c2VyL2FkbWluIGRpZCBzb21ldGhpbmcgYmFkIGJlY2F1c2UgaGUvc2hlIHRyaWVk
DQo+IHRvIGluZmxhdGUgdGhlIGJhbGxvb24gdG8gYW4gdW5zYWZlIHZhbHVlIi4gQmVsaWV2ZSBt
ZSwgSSBwcm9jZXNzZWQgYQ0KPiBjb3VwbGUgb2Ygc3VjaCBidWdyZXBvcnRzIHJlbGF0ZWQgdG8g
dmlydGlvLWJhbGxvb24gYW5kIHRoZSB3YXJuaW5nIHdlcmUNCj4gdmVyeSBoZWxwZnVsIGZvciB0
aGF0Lg0KDQpPaywgc28gYSBtZXNzYWdlIGlzIG5lZWRlZCwgYnV0IGRvZXMgaXQgaGF2ZSB0byBi
ZSBhIGdlbmVyaWMgZnJpZ2h0ZW5pbmcNCndhcm5pbmc/DQoNCkhvdyBhYm91dCB1c2luZyBfX0dG
UF9OT1dBUk4sIGFuZCBpZiBhbGxvY2F0aW9uIGRvIHNvbWV0aGluZyBsaWtlOg0KDQogIHByX3dh
cm4o4oCcQmFsbG9vbiBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsZWTigJ0pOw0KDQpPciBldmVuIHNv
bWV0aGluZyBtb3JlIGluZm9ybWF0aXZlPyBUaGlzIHdvdWxkIHN1cmVseSBiZSBsZXNzIGludGlt
aWRhdGluZw0KZm9yIGNvbW1vbiB1c2Vycy4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
