Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2E215A42
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 17:03:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F16CB8772E;
	Mon,  6 Jul 2020 15:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNO1rhcYg4_8; Mon,  6 Jul 2020 15:03:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B38F287721;
	Mon,  6 Jul 2020 15:03:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED0EC0891;
	Mon,  6 Jul 2020 15:03:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DFCDC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 15:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6976B883DC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 15:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTjBQKYJQnij
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 15:03:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B527885077
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 15:03:53 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066F3NNF033785; Mon, 6 Jul 2020 11:03:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322nun44sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 11:03:48 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 066F3l7X035838;
 Mon, 6 Jul 2020 11:03:47 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322nun43mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 11:03:46 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 066F0He2008635;
 Mon, 6 Jul 2020 15:01:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 322hd82f05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 15:01:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 066F1mTZ29556810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 15:01:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C093B52050;
 Mon,  6 Jul 2020 15:01:48 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.49.44])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DA42A52059;
 Mon,  6 Jul 2020 15:01:47 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Cornelia Huck <cohuck@redhat.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115651-mutt-send-email-mst@kernel.org>
 <20200629180526.41d0732b.cohuck@redhat.com>
 <26ecd4c6-837b-1ce6-170b-a0155e4dd4d4@linux.ibm.com>
 <a677decc-5be3-8095-bc33-0f95634011f6@linux.ibm.com>
 <20200706163340.2ce7a5f2.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <42f3733d-9f68-91b3-29f9-e88dd4495886@linux.ibm.com>
Date: Mon, 6 Jul 2020 17:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200706163340.2ce7a5f2.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_11:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0
 cotscore=-2147483648 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007060111
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 heiko.carstens@de.ibm.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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

CgpPbiAyMDIwLTA3LTA2IDE2OjMzLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IE9uIE1vbiwgNiBK
dWwgMjAyMCAxNTozNzozNyArMDIwMAo+IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5j
b20+IHdyb3RlOgo+IAo+PiBPbiAyMDIwLTA3LTAyIDE1OjAzLCBQaWVycmUgTW9yZWwgd3JvdGU6
Cj4+Pgo+Pj4KPj4+IE9uIDIwMjAtMDYtMjkgMTg6MDUsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4+
Pj4gT24gTW9uLCAyOSBKdW4gMjAyMCAxMTo1NzoxNCAtMDQwMAo+Pj4+ICJNaWNoYWVsIFMuIFRz
aXJraW4iIDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4gICAKPj4+Pj4gT24gV2VkLCBKdW4g
MTcsIDIwMjAgYXQgMTI6NDM6NTdQTSArMDIwMCwgUGllcnJlIE1vcmVsIHdyb3RlOgo+Pj4+Pj4g
QW4gYXJjaGl0ZWN0dXJlIHByb3RlY3RpbmcgdGhlIGd1ZXN0IG1lbW9yeSBhZ2FpbnN0IHVuYXV0
aG9yaXplZCBob3N0Cj4+Pj4+PiBhY2Nlc3MgbWF5IHdhbnQgdG8gZW5mb3JjZSBWSVJUSU8gSS9P
IGRldmljZSBwcm90ZWN0aW9uIHRocm91Z2ggdGhlCj4+Pj4+PiB1c2Ugb2YgVklSVElPX0ZfSU9N
TVVfUExBVEZPUk0uCj4+Pj4+Pgo+Pj4+Pj4gTGV0J3MgZ2l2ZSBhIGNoYW5jZSB0byB0aGUgYXJj
aGl0ZWN0dXJlIHRvIGFjY2VwdCBvciBub3QgZGV2aWNlcwo+Pj4+Pj4gd2l0aG91dCBWSVJUSU9f
Rl9JT01NVV9QTEFURk9STS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUgTW9y
ZWwgPHBtb3JlbEBsaW51eC5pYm0uY29tPgo+Pj4+Pj4gQWNrZWQtYnk6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+Cj4+Pj4+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
IDxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgwqAgYXJjaC9zMzkw
L21tL2luaXQuY8KgwqDCoMKgIHzCoCA2ICsrKysrKwo+Pj4+Pj4gIMKgIGRyaXZlcnMvdmlydGlv
L3ZpcnRpby5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gIMKgIGluY2x1ZGUv
bGludXgvdmlydGlvLmjCoCB8wqAgMiArKwo+Pj4+Pj4gIMKgIDMgZmlsZXMgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKQo+Pj4+ICAgCj4+Pj4+PiBAQCAtMTc5LDYgKzE5NCwxMyBAQCBpbnQgdmly
dGlvX2ZpbmFsaXplX2ZlYXR1cmVzKHN0cnVjdAo+Pj4+Pj4gdmlydGlvX2RldmljZSAqZGV2KQo+
Pj4+Pj4gIMKgwqDCoMKgwqAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9W
RVJTSU9OXzEpKQo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4+ICvC
oMKgwqAgaWYgKGFyY2hfbmVlZHNfdmlydGlvX2lvbW11X3BsYXRmb3JtKGRldikgJiYKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAhdmlydGlvX2hhc19mZWF0dXJlKGRldiwgVklSVElPX0ZfSU9NTVVf
UExBVEZPUk0pKSB7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oJmRldi0+ZGV2LAo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidmlydGlvOiBkZXZpY2UgbXVzdCBwcm92
aWRlIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNXG4iKTsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT0RFVjsKPj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4gKwo+Pj4+Pj4gIMKgwqDCoMKg
wqAgdmlydGlvX2FkZF9zdGF0dXMoZGV2LCBWSVJUSU9fQ09ORklHX1NfRkVBVFVSRVNfT0spOwo+
Pj4+Pj4gIMKgwqDCoMKgwqAgc3RhdHVzID0gZGV2LT5jb25maWctPmdldF9zdGF0dXMoZGV2KTsK
Pj4+Pj4+ICDCoMKgwqDCoMKgIGlmICghKHN0YXR1cyAmIFZJUlRJT19DT05GSUdfU19GRUFUVVJF
U19PSykpIHsKPj4+Pj4KPj4+Pj4gV2VsbCBkb24ndCB5b3UgbmVlZCB0byBjaGVjayBpdCAqYmVm
b3JlKiBWSVJUSU9fRl9WRVJTSU9OXzEsIG5vdCBhZnRlcj8KPj4+Pgo+Pj4+IEJ1dCBpdCdzIG9u
bHkgYXZhaWxhYmxlIHdpdGggVkVSU0lPTl8xIGFueXdheSwgaXNuJ3QgaXQ/IFNvIGl0IHByb2Jh
Ymx5Cj4+Pj4gYWxzbyBuZWVkcyB0byBmYWlsIHdoZW4gdGhpcyBmZWF0dXJlIGlzIG5lZWRlZCBp
ZiBWRVJTSU9OXzEgaGFzIG5vdCBiZWVuCj4+Pj4gbmVnb3RpYXRlZCwgSSB0aGluay4KPj4KPj4K
Pj4gd291bGQgYmUgc29tZXRoaW5nIGxpa2U6Cj4+Cj4+IC0gICAgICAgaWYgKCF2aXJ0aW9faGFz
X2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9WRVJTSU9OXzEpKQo+PiAtICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4+ICsgICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9W
RVJTSU9OXzEpKSB7Cj4+ICsgICAgICAgICAgICAgICByZXQgPSBhcmNoX2FjY2VwdF92aXJ0aW9f
ZmVhdHVyZXMoZGV2KTsKPj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRldl93YXJuKCZkZXYtPmRldiwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInZpcnRpbzogZGV2aWNlIG11c3QgcHJvdmlkZQo+PiBWSVJUSU9fRl9WRVJT
SU9OXzFcbiIpOwo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gKyAgICAgICB9Cj4g
Cj4gVGhhdCBsb29rcyB3cm9uZzsgSSB0aGluayB3ZSB3YW50IHRvIHZhbGlkYXRlIGluIGFsbCBj
YXNlcy4gV2hhdCBhYm91dDoKPiAKPiByZXQgPSBhcmNoX2FjY2VwdF92aXJ0aW9fZmVhdHVyZXMo
ZGV2KTsgLy8gdGhpcyBjYW4gaW5jbHVkZSBjaGVja2luZyBmb3IKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8vIG9sZGVyIG9yIG5ld2VyIGZlYXR1cmVzCj4gaWYg
KHJldCkKPiAJLy8gYXNzdW1lIHRoYXQgdGhlIGFyY2ggY2FsbGJhY2sgbW9hbmVkIGFscmVhZHkK
PiAJcmV0dXJuIHJldDsKPiAKPiBpZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19G
X1ZFUlNJT05fMSkpCj4gCXJldHVybiAwOwo+IAo+IC8vIGRvIHRoZSB2aXJ0aW8tMSBvbmx5IEZF
QVRVUkVTX09LIGRhbmNlCgpodW0sIHlvdSBhcmUgcmlnaHQsIEkgd2FzIHRvbyBmb2N1c2VkIG9u
IGtlZXBpbmcgbXkgc2ltcGxlIAphcmNoX2FjY2VwdF92aXJ0aW9fZmVhdHVyZXMoKSBmdW5jdGlv
biB1bmNoYW5nZWQuCkl0IG11c3QgYmUgbW9yZSBnZW5lcmFsLgoKPiAKPj4KPj4KPj4ganVzdCBh
IHRob3VnaHQgb24gdGhlIGZ1bmN0aW9uIG5hbWU6Cj4+IEl0IGJlY29tZXMgbW9yZSBnZW5lcmFs
IHRoYW4ganVzdCBJT01NVV9QTEFURk9STSByZWxhdGVkLgo+Pgo+PiBXaGF0IGRvIHlvdSB0aGlu
ayBvZjoKPj4KPj4gYXJjaF9hY2NlcHRfdmlydGlvX2ZlYXR1cmVzKCkKPiAKPiBPciBtYXliZSBh
cmNoX3ZhbGlkYXRlX3ZpcnRpb19mZWF0dXJlcygpPwoKT0sgdmFsaWRhdGVkLgoKVGhhbmtzLApQ
aWVycmUKCi0tIApQaWVycmUgTW9yZWwKSUJNIExhYiBCb2VibGluZ2VuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
