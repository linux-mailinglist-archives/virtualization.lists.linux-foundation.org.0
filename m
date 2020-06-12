Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 251201F7763
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 13:38:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89BEF88A44;
	Fri, 12 Jun 2020 11:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXVF5bVugaQF; Fri, 12 Jun 2020 11:38:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8887A88A4A;
	Fri, 12 Jun 2020 11:38:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2CEC016F;
	Fri, 12 Jun 2020 11:38:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85621C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 11:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7E85289765
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 11:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gt+-rZM1QUqM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 11:38:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A4AE689756
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 11:38:24 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CB586p176109; Fri, 12 Jun 2020 07:38:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31kq68ux0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 07:38:23 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05CBULiQ062841;
 Fri, 12 Jun 2020 07:38:23 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31kq68ux0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 07:38:22 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05CBVn5j013457;
 Fri, 12 Jun 2020 11:38:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 31g2s84mdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 11:38:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05CBcInX44302566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 11:38:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 297FD4204C;
 Fri, 12 Jun 2020 11:38:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA7854203F;
 Fri, 12 Jun 2020 11:38:17 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.76.70])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 11:38:17 +0000 (GMT)
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
From: Pierre Morel <pmorel@linux.ibm.com>
To: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
 <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
 <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
Message-ID: <6356ba7f-afab-75e1-05ff-4a22b88c610e@linux.ibm.com>
Date: Fri, 12 Jun 2020 13:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 cotscore=-2147483648 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, cohuck@redhat.com, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
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

CgpPbiAyMDIwLTA2LTEyIDExOjIxLCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4gCj4gCj4gT24gMjAy
MC0wNi0xMSAwNToxMCwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAyMC82LzEwIOS4i+WN
iDk6MTEsIFBpZXJyZSBNb3JlbCB3cm90ZToKPj4+IFByb3RlY3RlZCBWaXJ0dWFsaXNhdGlvbiBw
cm90ZWN0cyB0aGUgbWVtb3J5IG9mIHRoZSBndWVzdCBhbmQKPj4+IGRvIG5vdCBhbGxvdyBhIHRo
ZSBob3N0IHRvIGFjY2VzcyBhbGwgb2YgaXRzIG1lbW9yeS4KPj4+Cj4+PiBMZXQncyByZWZ1c2Ug
YSBWSVJUSU8gZGV2aWNlIHdoaWNoIGRvZXMgbm90IHVzZSBJT01NVQo+Pj4gcHJvdGVjdGVkIGFj
Y2Vzcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUgTW9yZWwgPHBtb3JlbEBsaW51eC5p
Ym0uY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYyB8
IDUgKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMgCj4+PiBiL2RyaXZl
cnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+PiBpbmRleCA1NzMwNTcyYjUyY2QuLjA2ZmZi
Yzk2NTg3YSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5j
Cj4+PiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+Pj4gQEAgLTk4Niw2
ICs5ODYsMTEgQEAgc3RhdGljIHZvaWQgdmlydGlvX2Njd19zZXRfc3RhdHVzKHN0cnVjdCAKPj4+
IHZpcnRpb19kZXZpY2UgKnZkZXYsIHU4IHN0YXR1cykKPj4+IMKgwqDCoMKgwqAgaWYgKCFjY3cp
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gK8KgwqDCoCAvKiBQcm90ZWN0ZWQg
VmlydHVhbGlzYXRpb24gZ3Vlc3QgbmVlZHMgSU9NTVUgKi8KPj4+ICvCoMKgwqAgaWYgKGlzX3By
b3RfdmlydF9ndWVzdCgpICYmCj4+PiArwqDCoMKgwqDCoMKgwqAgIV9fdmlydGlvX3Rlc3RfYml0
KHZkZXYsIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0YXR1cyAmPSB+VklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LOwo+Pj4gKwo+Pj4gwqDC
oMKgwqDCoCAvKiBXcml0ZSB0aGUgc3RhdHVzIHRvIHRoZSBob3N0LiAqLwo+Pj4gwqDCoMKgwqDC
oCB2Y2Rldi0+ZG1hX2FyZWEtPnN0YXR1cyA9IHN0YXR1czsKPj4+IMKgwqDCoMKgwqAgY2N3LT5j
bWRfY29kZSA9IENDV19DTURfV1JJVEVfU1RBVFVTOwo+Pgo+Pgo+PiBJIHdvbmRlciB3aGV0aGVy
IHdlIG5lZWQgbW92ZSBpdCB0byB2aXJ0aW8gY29yZSBpbnN0ZWFkIG9mIGNjdy4KPj4KPj4gSSB0
aGluayB0aGUgb3RoZXIgbWVtb3J5IHByb3RlY3Rpb24gdGVjaG5vbG9naWVzIG1heSBzdWZmZXIg
ZnJvbSB0aGlzIAo+PiBhcyB3ZWxsLgo+Pgo+PiBUaGFua3MKPj4KPiAKPiAKPiBXaGF0IHdvdWxk
IHlvdSB0aGluayBvZiB0aGUgZm9sbG93aW5nLCBhbHNvIHRha2luZyBpbnRvIGFjY291bnQgQ29u
bmllJ3MgCj4gY29tbWVudCBvbiB3aGVyZSB0aGUgdGVzdCBzaG91bGQgYmUgZG9uZToKPiAKPiAt
IGRlY2xhcmUgYSB3ZWFrIGZ1bmN0aW9uIGluIHZpcnRpby5jIGNvZGUsIHJldHVybmluZyB0aGF0
IG1lbW9yeSAKPiBwcm90ZWN0aW9uIGlzIG5vdCBpbiB1c2UuCj4gCj4gLSBvdmVyd3JpdGUgdGhl
IGZ1bmN0aW9uIGluIHRoZSBhcmNoIGNvZGUKPiAKPiAtIGNhbGwgdGhpcyBmdW5jdGlvbiBpbnNp
ZGUgY29yZSB2aXJ0aW9fZmluYWxpemVfZmVhdHVyZXMoKSBhbmQgaWYgCj4gcmVxdWlyZWQgZmFp
bCBpZiB0aGUgZGV2aWNlIGRvbid0IGhhdmUgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0uCj4gCj4g
QWx0ZXJuYXRpdmUgY291bGQgYmUgdG8gdGVzdCBhIGdsb2JhbCB2YXJpYWJsZSB0aGF0IHRoZSBh
cmNoaXRlY3R1cmUgCj4gd291bGQgb3ZlcndyaXRlIGlmIG5lZWRlZCBidXQgSSBmaW5kIHRoZSB3
ZWFrIGZ1bmN0aW9uIHNvbHV0aW9uIG1vcmUgCj4gZmxleGlibGUuCj4gCj4gV2l0aCBhIGZ1bmN0
aW9uLCB3ZSBhbHNvIGhhdmUgdGhlIHBvc3NpYmlsaXR5IHRvIHByb3ZpZGUgdGhlIGRldmljZSBh
cyAKPiBhcmd1bWVudCBhbmQgdGFrZSBhY3Rpb25zIGRlcGVuZGluZyBpdCwgdGhpcyBtYXkgYW5z
d2VyIEhhbGlsJ3MgY29uY2Vybi4KPiAKPiBSZWdhcmRzLAo+IFBpZXJyZQo+IAoKaHVtLCBpbiBi
ZXR3ZWVuIEkgZm91bmQgYW5vdGhlciB3YXkgd2hpY2ggc2VlbXMgdG8gbWUgbXVjaCBiZXR0ZXI6
CgpXZSBhbHJlYWR5IGhhdmUgdGhlIGZvcmNlX2RtYV91bmVuY3J5cHRlZCgpIGZ1bmN0aW9uIGF2
YWlsYWJsZSB3aGljaCAKQUZBSVUgaXMgd2hhdCB3ZSB3YW50IGZvciBlbmNyeXB0ZWQgbWVtb3J5
IHByb3RlY3Rpb24gYW5kIGlzIGFscmVhZHkgCnVzZWQgYnkgcG93ZXIgYW5kIHg4NiBTRVYvU01F
IGluIGEgd2F5IHRoYXQgc2VlbXMgQUZBSVUgY29tcGF0aWJsZSB3aXRoIApvdXIgcHJvYmxlbS4K
CkV2ZW4gRE1BIGFuZCBJT01NVSBhcmUgZGlmZmVyZW50IHRoaW5ncywgSSB0aGluayB0aGV5IHNo
b3VsZCBiZSB1c2VkIAp0b2dldGhlciBpbiBvdXIgY2FzZS4KCldoYXQgZG8geW91IHRoaW5rPwoK
VGhlIHBhdGNoIHdvdWxkIHRoZW4gYmUgc29tZXRoaW5nIGxpa2U6CgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aXJ0aW8vdmlydGlvLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYwppbmRleCBhOTc3
ZTMyYTg4ZjIuLjUzNDc2ZDViYmUzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlv
LmMKKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvLmMKQEAgLTQsNiArNCw3IEBACiAgI2luY2x1
ZGUgPGxpbnV4L3ZpcnRpb19jb25maWcuaD4KICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAg
I2luY2x1ZGUgPGxpbnV4L2lkci5oPgorI2luY2x1ZGUgPGxpbnV4L2RtYS1kaXJlY3QuaD4KICAj
aW5jbHVkZSA8dWFwaS9saW51eC92aXJ0aW9faWRzLmg+CgogIC8qIFVuaXF1ZSBudW1iZXJpbmcg
Zm9yIHZpcnRpbyBkZXZpY2VzLiAqLwpAQCAtMTc5LDYgKzE4MCwxMCBAQCBpbnQgdmlydGlvX2Zp
bmFsaXplX2ZlYXR1cmVzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICpkZXYpCiAgICAgICAgIGlmICgh
dmlydGlvX2hhc19mZWF0dXJlKGRldiwgVklSVElPX0ZfVkVSU0lPTl8xKSkKICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsKCisgICAgICAgaWYgKGZvcmNlX2RtYV91bmVuY3J5cHRlZCgmZGV2LT5k
ZXYpICYmCisgICAgICAgICAgICF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9JT01N
VV9QTEFURk9STSkpCisgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKKwogICAgICAgICB2aXJ0
aW9fYWRkX3N0YXR1cyhkZXYsIFZJUlRJT19DT05GSUdfU19GRUFUVVJFU19PSyk7CiAgICAgICAg
IHN0YXR1cyA9IGRldi0+Y29uZmlnLT5nZXRfc3RhdHVzKGRldik7CiAgICAgICAgIGlmICghKHN0
YXR1cyAmIFZJUlRJT19DT05GSUdfU19GRUFUVVJFU19PSykpIHsKCgpSZWdhcmRzLApQaWVycmUK
Ci0tIApQaWVycmUgTW9yZWwKSUJNIExhYiBCb2VibGluZ2VuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
