Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8918B540
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 14:17:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2EDE32048D;
	Thu, 19 Mar 2020 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKM6E7bSrNPv; Thu, 19 Mar 2020 13:17:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F4D620520;
	Thu, 19 Mar 2020 13:17:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D228C07FF;
	Thu, 19 Mar 2020 13:17:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3DE5C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 13:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A0C5B881A4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 13:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyy6ga3fxlKU
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 13:17:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3106387CDB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 13:17:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIk5ClK5qYtgAWV0obTZWJbXtMJJD6Jyjvai9Ml6vVHrKE+q96PGH8EviXhDCOkbS8vKBsPoKEaJbnvG9Fal67T4H0bDAs2d0n0p5we6DzQpC50EIvxxWro//rqfo2TaP3FcWgZhHAannJB6G6HhyxUt2pHLAFYMQayQ+1g23r6oxj22b0OAQ3j/o2ar2CW9EidTn1wI29wnWJJcuQRw3ZxUG2ATtjshCmrtsBv74dKc61XG1LpkhRkmmzxW6ucDcv9iUUgc32Rjy/9OKakrmVSfLT0+IAzAmSJ1reMmAD28uNptIwmslLEq0FyV8HV8ASF0L9v1ZNg4Tj6Gd+evRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//4y0pWVTPrnSvNPOIIyemyc3flXqyb2JpGvIAfEZdE=;
 b=aAHoEW8Jeu8Ir1vZmqkoJjmWmiS5JM+HJxbRis7YBIr1vQXoE3fBv5N9hxu7iFhSz0OitBgQ8lVi2Xd6CWl8J1GOxY41Dl81t5q0k9OqbKKncTpREYIrNLZaq53cJeRcM6lMyfJ5NamrIGCeO8H68yuUBoSt1vQ8ff15g917tby2ygJ6qsTvyviOFzy64qDspHPQMQ7UMPY4zs88INFCr6nBJxT+cxpvFBf5nxX+rKUkEQ2tvmtJ3ItIazz+sYKPf04ps8EXTi+DgxaJR49kOnoMA+HJjC6Zyu72nFPyo93p3zeiS2u0EkEKawqPvfRqx79/OfFchvBjXrk+9vkgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//4y0pWVTPrnSvNPOIIyemyc3flXqyb2JpGvIAfEZdE=;
 b=ctgsChtlzv5n/ICht1ZVLrdb0+JYVVQHj4LpKbu9ESkYQOFolPgR9C08rnlD8nQXO6O0ZarqipfkVcfsdBdbvDCoz7rwG0vVnc/RI2GAzyoh/T8uSNiWm0DkEKa8C61/SRIUU9sRV0j3eNS8LyGc4qsi9YkWjYsneXsyJKWcAyM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB7150.eurprd05.prod.outlook.com (10.141.234.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Thu, 19 Mar 2020 13:02:44 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.025; Thu, 19 Mar 2020
 13:02:44 +0000
Date: Thu, 19 Mar 2020 10:02:39 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V6 8/8] virtio: Intel IFC VF driver for VDPA
Message-ID: <20200319130239.GW13183@mellanox.com>
References: <20200318080327.21958-1-jasowang@redhat.com>
 <20200318080327.21958-9-jasowang@redhat.com>
 <20200318122255.GG13183@mellanox.com>
 <30359bae-d66a-0311-0028-d7d33b8295f2@redhat.com>
Content-Disposition: inline
In-Reply-To: <30359bae-d66a-0311-0028-d7d33b8295f2@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:208:d4::28) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR04CA0015.namprd04.prod.outlook.com (2603:10b6:208:d4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20 via Frontend Transport; Thu, 19 Mar 2020 13:02:43 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jEuop-0005nX-Qe; Thu, 19 Mar 2020 10:02:39 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad14dc61-9e34-466b-22ac-08d7cc05d03d
X-MS-TrafficTypeDiagnostic: VI1PR05MB7150:|VI1PR05MB7150:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB715064BC27E89253BFFAC4E1CFF40@VI1PR05MB7150.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(8676002)(316002)(4326008)(86362001)(81156014)(33656002)(81166006)(6916009)(66946007)(2906002)(9786002)(36756003)(5660300002)(52116002)(66476007)(66556008)(1076003)(9746002)(2616005)(26005)(8936002)(186003)(7416002)(478600001)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB7150;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGbCtPrNZR30Vw4cMomAnsEMxqxb7nXS3Nqt9D5wGiTe85znPvVPzKx8XkvJIQYP48zDFzY7Q2y4dnJrrOoEnHjI2VubN65nzP5ChVOsUi0mawkO8E6WKRuB5HFRzzlhv9MQx+t21BAGE/Usd6Wvg6ZpR75I1U2K4L8ctTD8h0VrGVJ/5ZBgAq1qHKX2I8tgN7FPVOienHVXX5rWA6ls5fgCIa+jVZlUd8kFngUcFKxuGYWYbvKZRX9gkuiF+Xz8gf11VDovMsjftoPK2XnbZS2Bce2zFlxoUoj8GFahml/KbG+OX/Un9gn411Q7yE+VyxTSrhaceR5flN/k+wypYYv4QCgzOz1tRNu4vIbtgrDqB1XVvj5jQ/3Q/SXSv5NctIpmiINxEXGMsioJiaSf6O0zY8g9DdHDLHAxhPVjhHM3FNfkqSdGZov5prd16B2d6X3qvVprIPz2ui+msdiu9l/ubCYr7kD9pUqA8p1fvW1FI2/mE5WsjODl4NHMC9xQ
X-MS-Exchange-AntiSpam-MessageData: VD8NG3rnq/NO3+Lmfh4zuctlXKVCPu1CGfgSH+nAM0RcyX1UBYYplgQoSCynalY5URwpOW6GAKgWGwW8Dp4dHdmi+JqkZLaBk8qZ/Wowu/ZHd6l2RhU6swPz6uIVAnzoKJZ9+cAFS6dQR9oNPSFcNg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad14dc61-9e34-466b-22ac-08d7cc05d03d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 13:02:44.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvE7FDAJpRIABvezilJMYsiCHpeefYaEfNtWFiKgVppn+f/Xk35iCoYYVXIaKUP62fQAxrly5kJyGaFWHp1s9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB7150
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6MTQ6MzdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzMvMTgg5LiL5Y2IODoyMiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gV2VkLCBNYXIgMTgsIDIwMjAgYXQgMDQ6MDM6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+
ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50IGlmY3ZmX3ZkcGFfYXR0YWNoKHN0cnVjdCBpZmN2Zl9h
ZGFwdGVyICphZGFwdGVyKQo+ID4gPiArewo+ID4gPiArCWludCByZXQ7Cj4gPiA+ICsKPiA+ID4g
KwlhZGFwdGVyLT52ZHBhX2RldiAgPSB2ZHBhX2FsbG9jX2RldmljZShhZGFwdGVyLT5kZXYsIGFk
YXB0ZXItPmRldiwKPiA+ID4gKwkJCQkJICAgICAgICZpZmNfdmRwYV9vcHMpOwo+ID4gPiArCWlm
IChJU19FUlIoYWRhcHRlci0+dmRwYV9kZXYpKSB7Cj4gPiA+ICsJCUlGQ1ZGX0VSUihhZGFwdGVy
LT5kZXYsICJGYWlsZWQgdG8gaW5pdCBpZmN2ZiBvbiB2ZHBhIGJ1cyIpOwo+ID4gPiArCQlwdXRf
ZGV2aWNlKCZhZGFwdGVyLT52ZHBhX2Rldi0+ZGV2KTsKPiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7
Cj4gPiA+ICsJfQo+ID4gVGhlIHBvaW50IG9mIGhhdmluZyBhbiBhbGxvYyBjYWxsIGlzIHNvIHRo
YXQgdGhlIGRyaXZlcnMKPiA+IGlmY3ZmX2FkYXB0b3IgbWVtb3J5IGNvdWxkIGJlIHBsYWNlZCBp
biB0aGUgc2FtZSBzdHJ1Y3QgLSBlZyB1c2UKPiA+IGNvbnRhaW5lcl9vZiB0byBmbGlwIGJldHdl
ZW4gdGhlbSwgYW5kIGhhdmUgYSBrcmVmIGZvciBib3RoIG1lbW9yaWVzLgo+ID4gCj4gPiBJdCBz
ZWVtIHJlYWxseSB3ZWlyZCB0byBoYXZlIGFuIGFsbG9jIGZvbGxvd2VkIGltbWVkaWF0ZWx5IGJ5
Cj4gPiByZWdpc3Rlci4KPiAKPiAKPiBJIGFkbWl0IHRoZSBpZmN2Zl9hZGFwdGVyIGlzIG5vdCBj
b3JyZWN0bHkgcmVmLWNvdW50ZWQuIFdoYXQgeW91IHN1Z2dlc3QKPiBzaG91bGQgd29yay4gQnV0
IGl0IGxvb2tzIHRvIG1lIHRoZSBmb2xsb3dpbmcgaXMgbW9yZSBjbGVhbmVyIHNpbmNlIHRoZQo+
IG1lbWJlcnMgb2YgaWZjdmZfYWRhcHRlciBhcmUgYWxsIHJlbGF0ZWQgdG8gUENJIGRldmljZSBu
b3QgdkRQQSBpdHNlbGYuCgpJJ3ZlIGRvbmUgaXQgYm90aCB3YXlzIChlZyB0cG0gaXMgYXMgeW91
IGRlc2NyaWJlLCBpYiBpcyB1c2luZyBhbGxvYykuCgpJIHRlbmQgdG8gcHJlZmVyIHRoZSBhbGxv
YyBtZXRob2QgdG9kYXksIGFsbG93aW5nIHRoZSBkcml2ZXIgbWVtb3J5IHRvCmhhdmUgYSBwcm9w
ZXIgcmVmY291bnQgbWFrZXMgdGhlIGRyaXZlciBzdHJ1Y3R1cmUgdXNhYmxlIHdpdGggUkNVIGFu
ZAphbGxvd3Mgc2ltcGxlIHNvbHV0aW9ucyB0byBzb21lIHRyaWNreSBjYXNlcy4gSXQgaXMgYSBi
aXQgaGFyZCB0bwpzd2l0Y2ggdG8gdGhpcyBsYXRlci4uCgo+IC0ga2VlcCB0aGUgY3VycmVudCBs
YXlvdXQgb2YgaWZjdmZfYWRhcHRlcgo+IC0gbWVyZ2UgdmRwYV9hbGxvY19kZXZpY2UoKSBhbmQg
dmRwYV9yZWdpc3Rlcl9kZXZpY2UoKQo+IC0gdXNlIGRldnJlcyB0byBiaW5kIGlmY3ZmX2FkYXB0
ZXIgcmVmY250L2xpZmN5Y2xlIHRvIHRoZSB1bmRlciBQQ0kgZGV2aWNlCgpUaGlzIGlzIGFsbW9z
dCB3aGF0IHRwbSBkb2VzLiBLZWVwIGluIG1pbmQgdGhlIGxpZmVjeWNsZSB3aXRoIGRldm0gaXMK
anVzdCBzbGlnaHRseSBwYXN0IHRoZSBkcml2ZXIgcmVtb3ZlIGNhbGwsIHNvIHJlbW92ZSBzdGls
bCAKbXVzdCByZXZva2UgYWxsIGV4dGVybmFsIHJlZmVyZW5jZXMgdG8gdGhlIG1lbW9yeS4KClRo
ZSBtZXJnaW5nIGFsbG9jIGFuZCByZWdpc3RlciByYXJlbHkgd29ya3Mgb3V0LCB0aGUgcmVnaXN0
ZXIgbXVzdCBiZQp0aGUgdmVyeSBsYXN0IHRoaW5nIGRvbmUsIGFuZCB1c3VhbGx5IHlvdSBuZWVk
IHRoZSBzdWJzeXN0ZW0gcG9pbnRlcgp0byBkbyBwcmUtcmVnaXN0cmF0aW9uIHNldHVwIGluIGFu
eXRoaW5nIGJ1dCB0aGUgbW9zdCB0cml2aWFsIG9mCnN1YnN5c3RlbXMgYW5kIGRyaXZlcnMuCgo+
IElmIHdlIGdvIGZvciB0aGUgY29udGFpbmVyX29mIG1ldGhvZCwgd2UgcHJvYmFibHkgbmVlZAo+
IAo+IC0gYWNjZXB0IGEgc2l6ZSBvZiBwYXJlbnQgcGFyZW50IHN0cnVjdHVyZSBpbiB2ZHBhX2Fs
bG9jX2RldmljZSgpIGFuZAo+IG1hbmRhdGUgdmRwYV9kZXZpY2UgdG8gYmUgdGhlIGZpcnN0IG1l
bWJlciBvZiBpZmN2Zl9hZGFwdGVyCj4gLSB3ZSBuZWVkIHByb3ZpZGUgYSB3YXkgdG8gZnJlZSBy
ZXNvdXJjZXMgb2YgcGFyZW50IHN0cnVjdHVyZSB3aGVuIHdlCj4gZGVzdHJveSB2RFBBIGRldmlj
ZQoKWWVwLiBuZXRkZXYgYW5kIHJkbWEgd29yayB0aGlzIHdheSB3aXRoIGEgZnJlZSBtZW1vcnkg
Y2FsbGJhY2sgaW4gdGhlCmV4aXN0aW5nIG9wcyBzdHJ1Y3R1cmVzLgoKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
