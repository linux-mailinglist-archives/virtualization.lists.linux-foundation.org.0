Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216A2297B0
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 13:48:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4041F848AA;
	Wed, 22 Jul 2020 11:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8Y7p_mC1O-p; Wed, 22 Jul 2020 11:48:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B36CB848C2;
	Wed, 22 Jul 2020 11:48:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D15FC004C;
	Wed, 22 Jul 2020 11:48:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51331C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C57522767
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gx3E-1YWREnZ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:48:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id D4D7C20407
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:48:38 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MBWM5w052537; Wed, 22 Jul 2020 07:48:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrr308-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 07:48:31 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06MBWXnx053701;
 Wed, 22 Jul 2020 07:48:30 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrr2yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 07:48:30 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06MBeoI8032571;
 Wed, 22 Jul 2020 11:48:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq84yjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 11:48:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06MBl2TA66453950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 11:47:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB71AE045;
 Wed, 22 Jul 2020 11:48:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DA1CAE04D;
 Wed, 22 Jul 2020 11:48:25 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.50.252])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 11:48:25 +0000 (GMT)
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
 <20200715054807-mutt-send-email-mst@kernel.org>
 <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
 <20200715074917-mutt-send-email-mst@kernel.org>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <be992b00-de1d-4499-ee7f-b2b2b5a8879d@linux.ibm.com>
Date: Wed, 22 Jul 2020 13:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200715074917-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_04:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220085
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, hca@linux.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, david@gibson.dropbear.id.au
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

CgpPbiAyMDIwLTA3LTE1IDEzOjUxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMTUsIDIwMjAgYXQgMDY6MTY6NTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4K
Pj4gT24gMjAyMC83LzE1IOS4i+WNiDU6NTAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFdlZCwgSnVsIDE1LCAyMDIwIGF0IDEwOjMxOjA5QU0gKzAyMDAsIFBpZXJyZSBNb3JlbCB3
cm90ZToKPj4+PiBJZiBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gaXMgYWN0aXZlIG9uIHMzOTAs
IHRoZSB2aXJ0aW8gcXVldWVzIGFyZQo+Pj4+IG5vdCBhY2Nlc3NpYmxlIHRvIHRoZSBob3N0LCB1
bmxlc3MgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0gaGFzIGJlZW4KPj4+PiBuZWdvdGlhdGVkLiBV
c2UgdGhlIG5ldyBhcmNoX3ZhbGlkYXRlX3ZpcnRpb19mZWF0dXJlcygpIGludGVyZmFjZSB0bwo+
Pj4+IGZhaWwgcHJvYmUgaWYgdGhhdCdzIG5vdCB0aGUgY2FzZSwgcHJldmVudGluZyBhIGhvc3Qg
ZXJyb3Igb24gYWNjZXNzCj4+Pj4gYXR0ZW1wdC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBp
ZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IENvcm5l
bGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+Pj4+IEFja2VkLWJ5OiBIYWxpbCBQYXNpYyA8
cGFzaWNAbGludXguaWJtLmNvbT4KPj4+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
IDxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGFyY2gvczM5MC9tbS9p
bml0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAv
bW0vaW5pdC5jIGIvYXJjaC9zMzkwL21tL2luaXQuYwo+Pj4+IGluZGV4IDZkYzdjM2I2MGVmNi4u
ZDM5YWY2NTU0ZDRmIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvczM5MC9tbS9pbml0LmMKPj4+PiAr
KysgYi9hcmNoL3MzOTAvbW0vaW5pdC5jCj4+Pj4gQEAgLTQ1LDYgKzQ1LDcgQEAKPj4+PiAgICAj
aW5jbHVkZSA8YXNtL2thc2FuLmg+Cj4+Pj4gICAgI2luY2x1ZGUgPGFzbS9kbWEtbWFwcGluZy5o
Pgo+Pj4+ICAgICNpbmNsdWRlIDxhc20vdXYuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRp
b19jb25maWcuaD4KPj4+PiAgICBwZ2RfdCBzd2FwcGVyX3BnX2RpcltQVFJTX1BFUl9QR0RdIF9f
c2VjdGlvbiguYnNzLi5zd2FwcGVyX3BnX2Rpcik7Cj4+Pj4gQEAgLTE2MSw2ICsxNjIsMzMgQEAg
Ym9vbCBmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+ICAgIAly
ZXR1cm4gaXNfcHJvdF92aXJ0X2d1ZXN0KCk7Cj4+Pj4gICAgfQo+Pj4+ICsvKgo+Pj4+ICsgKiBh
cmNoX3ZhbGlkYXRlX3ZpcnRpb19mZWF0dXJlcwo+Pj4+ICsgKiBAZGV2OiB0aGUgVklSVElPIGRl
dmljZSBiZWluZyBhZGRlZAo+Pj4+ICsgKgo+Pj4+ICsgKiBSZXR1cm4gYW4gZXJyb3IgaWYgcmVx
dWlyZWQgZmVhdHVyZXMgYXJlIG1pc3Npbmcgb24gYSBndWVzdCBydW5uaW5nCj4+Pj4gKyAqIHdp
dGggcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uLgo+Pj4+ICsgKi8KPj4+PiAraW50IGFyY2hfdmFs
aWRhdGVfdmlydGlvX2ZlYXR1cmVzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICpkZXYpCj4+Pj4gK3sK
Pj4+PiArCWlmICghaXNfcHJvdF92aXJ0X2d1ZXN0KCkpCj4+Pj4gKwkJcmV0dXJuIDA7Cj4+Pj4g
Kwo+Pj4+ICsJaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9WRVJTSU9OXzEp
KSB7Cj4+Pj4gKwkJZGV2X3dhcm4oJmRldi0+ZGV2LAo+Pj4+ICsJCQkgImxlZ2FjeSB2aXJ0aW8g
bm90IHN1cHBvcnRlZCB3aXRoIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvblxuIik7Cj4+Pj4gKwkJ
cmV0dXJuIC1FTk9ERVY7Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJaWYgKCF2aXJ0aW9faGFzX2Zl
YXR1cmUoZGV2LCBWSVJUSU9fRl9JT01NVV9QTEFURk9STSkpIHsKPj4+PiArCQlkZXZfd2Fybigm
ZGV2LT5kZXYsCj4+Pj4gKwkJCSAic3VwcG9ydCBmb3IgbGltaXRlZCBtZW1vcnkgYWNjZXNzIHJl
cXVpcmVkIGZvciBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb25cbiIpOwo+Pj4+ICsJCXJldHVybiAt
RU5PREVWOwo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiArCXJldHVybiAwOwo+Pj4+ICt9Cj4+Pj4gKwo+
Pj4+ICAgIC8qIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbiAqLwo+Pj4+ICAgIHN0YXRpYyB2b2lk
IHB2X2luaXQodm9pZCkKPj4+PiAgICB7Cj4+PiBXaGF0IGJvdGhlcnMgbWUgaGVyZSBpcyB0aGF0
IGFyY2ggY29kZSBkZXBlbmRzIG9uIHZpcnRpbyBub3cuCj4+PiBJdCB3b3JrcyBldmVuIHdpdGgg
YSBtb2R1bGFyIHZpcnRpbyB3aGVuIGZ1bmN0aW9ucyBhcmUgaW5saW5lLAo+Pj4gYnV0IGl0IHNl
ZW1zIGZyYWdpbGU6IGUuZy4gaXQgYnJlYWtzIHZpcnRpbyBhcyBhbiBvdXQgb2YgdHJlZSBtb2R1
bGUsCj4+PiBzaW5jZSBsYXlvdXQgb2Ygc3RydWN0IHZpcnRpb19kZXZpY2UgY2FuIGNoYW5nZS4K
Pj4KPj4KPj4gVGhlIGNvZGUgd2FzIG9ubHkgY2FsbGVkIGZyb20gdmlydGlvLmMgc28gaXQgc2hv
dWxkIGJlIGZpbmUuCj4+Cj4+IEFuZCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgd2UgZG9uJ3Qg
bmVlZCB0byBjYXJlIGFib3V0IHRoZSBrQUJJIGlzc3VlCj4+IGR1cmluZyB1cHN0cmVhbSBkZXZl
bG9wbWVudD8KPj4KPj4gVGhhbmtzCj4gCj4gTm8sIGJ1dCBzbyBmYXIgaXQgaGFzIGJlZW4gY29u
dmVuaWVudCBhdCBsZWFzdCBmb3IgbWUsIGZvciBkZXZlbG9wbWVudCwKPiB0byBqdXN0IGJlIGFi
bGUgdG8gdW5sb2FkIGFsbCBvZiB2aXJ0aW8gYW5kIGxvYWQgYSBkaWZmZXJlbnQgdmVyc2lvbi4K
PiAKPiAKPj4KPj4+Cj4+PiBJJ20gbm90IHN1cmUgd2hhdCB0byBkbyB3aXRoIHRoaXMgeWV0LCB3
aWxsIHRyeSB0byB0aGluayBhYm91dCBpdAo+Pj4gb3ZlciB0aGUgd2Vla2VuZC4gVGhhbmtzIQo+
Pj4KPj4+Cj4+Pj4gLS0gCj4+Pj4gMi4yNS4xCj4gCgpIaSBNaWNoYWVsLAoKSSBhbSBub3Qgc3Vy
ZSB0byB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIHNvIEkgbWF5IHByb3Bvc2UgYSB3cm9uZyAKc29s
dXRpb24gYnV0LCBsZXQncyB0cnk6CgpXb3VsZCBhIGNhbGxiYWNrIHJlZ2lzdHJhdGlvbiBpbnN0
ZWFkIG9mIGEgd2VhayBmdW5jdGlvbiBzb2x2ZSB0aGUgcHJvYmxlbT8KVGhlIHJlZ2lzdHJhdGlu
ZyBmdW5jdGlvbiBpbiBjb3JlIGNvdWxkIHRlc3QgYSBwYXJhbWV0ZXIgdG8gY2hlY2sgaWYgdGhl
IApjYWxsYmFjayBpcyBpbiBzeW5jIHdpdGggdGhlIFZJUlRJTyBjb3JlLgoKV2hhdCBkbyB5b3Ug
dGhpbms/CgpSZWdhcmRzLApQaWVycmUKCgoKLS0gClBpZXJyZSBNb3JlbApJQk0gTGFiIEJvZWJs
aW5nZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
