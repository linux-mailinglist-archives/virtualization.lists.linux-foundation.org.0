Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53629F90B
	for <lists.virtualization@lfdr.de>; Fri, 30 Oct 2020 00:22:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1F70B1FE0A;
	Thu, 29 Oct 2020 23:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ns4G8C4Qg0vg; Thu, 29 Oct 2020 23:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 16655203E1;
	Thu, 29 Oct 2020 23:22:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4B78C0051;
	Thu, 29 Oct 2020 23:22:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74EB1C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 23:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50836203D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 23:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibeA7fbry3sf
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 23:22:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by silver.osuosl.org (Postfix) with ESMTPS id 51BD21FE0A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 23:22:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09TNJ9Sx088612;
 Thu, 29 Oct 2020 23:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : mime-version : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=iCgOVVY9koyTzdluMrIUyT5Ny5E+jy24QzqSTuJHj3c=;
 b=UajiZKtOLPMZtL4AG64Xxkos9PRqnZddXJ5LXntzK8W3pU7KKiQPPFtzXX9vnGkiw2LM
 uqzNDfORhIbgplMymj7XD1FpMg/Hf8whx4L8tqGQDy9PXWAJ4ugOjSDRhW99TLdepN2J
 7qQGSg8WqIZQE5qSmkOjXVD5B40b0/FZaxTInRIXxtLzKuzVTUFCmCrJ8mP3qDEZSnug
 QXag+cz2jOeaOANA4QZ6Z6aj3nu8crXupZni+vUedqpHmuoD8Q37t2Edoa+EcIUbP1HF
 P+syOCwB/I7mS5sR40frL/ppQqhslouqViVD3dUuz1LtZYDfYAKo6RmnnfnvELGJmRnE qQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34cc7m7ehf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Oct 2020 23:22:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09TNKC6J073198;
 Thu, 29 Oct 2020 23:22:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34cx612v67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 23:22:34 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09TNMYBQ030489;
 Thu, 29 Oct 2020 23:22:34 GMT
Received: from [10.159.253.93] (/10.159.253.93)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Oct 2020 16:22:33 -0700
Message-ID: <5F9B4EB7.607@oracle.com>
Date: Thu, 29 Oct 2020 16:22:31 -0700
From: si-wei liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
 rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 2/2] vhost-vdpa: fix page pinning leakage in error path
References: <1601701330-16837-1-git-send-email-si-wei.liu@oracle.com>
 <1601701330-16837-3-git-send-email-si-wei.liu@oracle.com>
 <574a64e3-8873-0639-fe32-248cb99204bc@redhat.com>
 <5F863B83.6030204@oracle.com>
 <835e79de-52d9-1d07-71dd-d9bee6b9f62e@redhat.com>
 <20201015091150-mutt-send-email-mst@kernel.org> <5F88AE4A.9030300@oracle.com>
 <20201029175305-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201029175305-mutt-send-email-mst@kernel.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=2 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290162
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=2
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290162
Cc: lingshan.zhu@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 boris.ostrovsky@oracle.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDEwLzI5LzIwMjAgMjo1MyBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFRo
dSwgT2N0IDE1LCAyMDIwIGF0IDAxOjE3OjE0UE0gLTA3MDAsIHNpLXdlaSBsaXUgd3JvdGU6Cj4+
IE9uIDEwLzE1LzIwMjAgNjoxMSBBTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4gT24g
VGh1LCBPY3QgMTUsIDIwMjAgYXQgMDI6MTU6MzJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4+PiBPbiAyMDIwLzEwLzE0IOS4iuWNiDc6NDIsIHNpLXdlaSBsaXUgd3JvdGU6Cj4+Pj4+PiBT
byB3aGF0IEkgc3VnZ2VzdCBpcyB0byBmaXggdGhlIHBpbm5pbmcgbGVha2FnZSBmaXJzdCBhbmQg
ZG8gdGhlCj4+Pj4+PiBwb3NzaWJsZSBvcHRpbWl6YXRpb24gb24gdG9wICh3aGljaCBpcyBzdGls
bCBxdWVzdGlvbmFibGUgdG8gbWUpLgo+Pj4+PiBPSy4gVW5mb3J0dW5hdGVseSwgdGhpcyB3YXMg
cGlja2VkIGFuZCBnb3QgbWVyZ2VkIGluIHVwc3RyZWFtLiBTbyBJIHdpbGwKPj4+Pj4gcG9zdCBh
IGZvbGxvdyB1cCBwYXRjaCBzZXQgdG8gMSkgcmV2ZXJ0IHRoZSBjb21taXQgdG8gdGhlIG9yaWdp
bmFsCj4+Pj4+IF9fZ2V0X2ZyZWVfcGFnZSgpIGltcGxlbWVudGF0aW9uLCBhbmQgMikgZml4IHRo
ZSBhY2NvdW50aW5nIGFuZCBsZWFrYWdlCj4+Pj4+IG9uIHRvcC4gV2lsbCBpdCBiZSBmaW5lPwo+
Pj4+IEZpbmUuCj4+Pj4KPj4+PiBUaGFua3MKPj4+IEZpbmUgYnkgbWUgdG9vLgo+Pj4KPj4gVGhh
bmtzLCBNaWNoYWVsICYgSmFzb24uIEkgd2lsbCBwb3N0IHRoZSBmaXggc2hvcnRseS4gU3RheSB0
dW5lZC4KPj4KPj4gLVNpd2VpCj4gZGlkIEkgbWlzcyB0aGUgcGF0Y2g/Cj4KWW91IGRpZG4ndCwg
c29ycnkuIEkgd2FzIGxvb2tpbmcgaW50byBhIHdheSB0byBzcGVlZCB1cCB0aGUgYm9vdCB0aW1l
IApmb3IgbGFyZ2UgbWVtb3J5IGd1ZXN0IGJ5IG11bHRpLXRocmVhZGluZyB0aGUgcGFnZSBwaW5u
aW5nIHByb2Nlc3MsIGFuZCAKaXQgdHVybnMgb3V0IEkgbmVlZCBtb3JlIHRpbWUgb24gdGhhdC4g
V2lsbCBwb3N0IHRoZSBmaXggSSBoYXZlIG5vdyAKc29vbiwgaG9wZWZ1bGx5IHRvbW9ycm93LgoK
LVNpd2VpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
