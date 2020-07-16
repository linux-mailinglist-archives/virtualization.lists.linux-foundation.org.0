Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F11222143
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 13:20:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 242C42342E;
	Thu, 16 Jul 2020 11:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhFEx8f0XYwL; Thu, 16 Jul 2020 11:20:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A289D2343B;
	Thu, 16 Jul 2020 11:20:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71EF2C0733;
	Thu, 16 Jul 2020 11:20:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B09FC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 11:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 091108A6A7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 11:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ueiklx8EGz1b
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 11:20:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A0708A69F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 11:20:11 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GB2hXT098147; Thu, 16 Jul 2020 07:20:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x5yqcsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:20:06 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GB5ZkG110820;
 Thu, 16 Jul 2020 07:20:05 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x5yqcrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:20:05 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GBFsbA028057;
 Thu, 16 Jul 2020 11:20:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 329nmyhr1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 11:20:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GBK0SX48955422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 11:20:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9853DA4051;
 Thu, 16 Jul 2020 11:20:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE84A4059;
 Thu, 16 Jul 2020 11:19:56 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.5.27])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 11:19:56 +0000 (GMT)
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
 <20200715054807-mutt-send-email-mst@kernel.org>
 <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
 <20200715074917-mutt-send-email-mst@kernel.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Message-ID: <3782338a-6491-dc35-7c66-97b91a20df0d@de.ibm.com>
Date: Thu, 16 Jul 2020 13:19:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200715074917-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_05:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007160088
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org,
 Pierre Morel <pmorel@linux.ibm.com>, kvm@vger.kernel.org,
 thomas.lendacky@amd.com, hca@linux.ibm.com, cohuck@redhat.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 david@gibson.dropbear.id.au, frankja@linux.ibm.com
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

CgpPbiAxNS4wNy4yMCAxMzo1MSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFdlZCwg
SnVsIDE1LCAyMDIwIGF0IDA2OjE2OjU5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Cj4+
IE9uIDIwMjAvNy8xNSDkuIvljYg1OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIEp1bCAxNSwgMjAyMCBhdCAxMDozMTowOUFNICswMjAwLCBQaWVycmUgTW9yZWwgd3Jv
dGU6Cj4+Pj4gSWYgcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uIGlzIGFjdGl2ZSBvbiBzMzkwLCB0
aGUgdmlydGlvIHF1ZXVlcyBhcmUKPj4+PiBub3QgYWNjZXNzaWJsZSB0byB0aGUgaG9zdCwgdW5s
ZXNzIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNIGhhcyBiZWVuCj4+Pj4gbmVnb3RpYXRlZC4gVXNl
IHRoZSBuZXcgYXJjaF92YWxpZGF0ZV92aXJ0aW9fZmVhdHVyZXMoKSBpbnRlcmZhY2UgdG8KPj4+
PiBmYWlsIHByb2JlIGlmIHRoYXQncyBub3QgdGhlIGNhc2UsIHByZXZlbnRpbmcgYSBob3N0IGVy
cm9yIG9uIGFjY2Vzcwo+Pj4+IGF0dGVtcHQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVy
cmUgTW9yZWwgPHBtb3JlbEBsaW51eC5pYm0uY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBDb3JuZWxp
YSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KPj4+PiBBY2tlZC1ieTogSGFsaWwgUGFzaWMgPHBh
c2ljQGxpbnV4LmlibS5jb20+Cj4+Pj4gQWNrZWQtYnk6IENocmlzdGlhbiBCb3JudHJhZWdlciA8
Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KPj4+PiAtLS0KPj4+PiAgIGFyY2gvczM5MC9tbS9pbml0
LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9tbS9p
bml0LmMgYi9hcmNoL3MzOTAvbW0vaW5pdC5jCj4+Pj4gaW5kZXggNmRjN2MzYjYwZWY2Li5kMzlh
ZjY1NTRkNGYgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9zMzkwL21tL2luaXQuYwo+Pj4+ICsrKyBi
L2FyY2gvczM5MC9tbS9pbml0LmMKPj4+PiBAQCAtNDUsNiArNDUsNyBAQAo+Pj4+ICAgI2luY2x1
ZGUgPGFzbS9rYXNhbi5oPgo+Pj4+ICAgI2luY2x1ZGUgPGFzbS9kbWEtbWFwcGluZy5oPgo+Pj4+
ICAgI2luY2x1ZGUgPGFzbS91di5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvdmlydGlvX2NvbmZp
Zy5oPgo+Pj4+ICAgcGdkX3Qgc3dhcHBlcl9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX3NlY3Rpb24o
LmJzcy4uc3dhcHBlcl9wZ19kaXIpOwo+Pj4+IEBAIC0xNjEsNiArMTYyLDMzIEBAIGJvb2wgZm9y
Y2VfZG1hX3VuZW5jcnlwdGVkKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiAgIAlyZXR1cm4gaXNf
cHJvdF92aXJ0X2d1ZXN0KCk7Cj4+Pj4gICB9Cj4+Pj4gKy8qCj4+Pj4gKyAqIGFyY2hfdmFsaWRh
dGVfdmlydGlvX2ZlYXR1cmVzCj4+Pj4gKyAqIEBkZXY6IHRoZSBWSVJUSU8gZGV2aWNlIGJlaW5n
IGFkZGVkCj4+Pj4gKyAqCj4+Pj4gKyAqIFJldHVybiBhbiBlcnJvciBpZiByZXF1aXJlZCBmZWF0
dXJlcyBhcmUgbWlzc2luZyBvbiBhIGd1ZXN0IHJ1bm5pbmcKPj4+PiArICogd2l0aCBwcm90ZWN0
ZWQgdmlydHVhbGl6YXRpb24uCj4+Pj4gKyAqLwo+Pj4+ICtpbnQgYXJjaF92YWxpZGF0ZV92aXJ0
aW9fZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKmRldikKPj4+PiArewo+Pj4+ICsJaWYg
KCFpc19wcm90X3ZpcnRfZ3Vlc3QoKSkKPj4+PiArCQlyZXR1cm4gMDsKPj4+PiArCj4+Pj4gKwlp
ZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpIHsKPj4+PiAr
CQlkZXZfd2FybigmZGV2LT5kZXYsCj4+Pj4gKwkJCSAibGVnYWN5IHZpcnRpbyBub3Qgc3VwcG9y
dGVkIHdpdGggcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uXG4iKTsKPj4+PiArCQlyZXR1cm4gLUVO
T0RFVjsKPj4+PiArCX0KPj4+PiArCj4+Pj4gKwlpZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYs
IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSkgewo+Pj4+ICsJCWRldl93YXJuKCZkZXYtPmRldiwK
Pj4+PiArCQkJICJzdXBwb3J0IGZvciBsaW1pdGVkIG1lbW9yeSBhY2Nlc3MgcmVxdWlyZWQgZm9y
IHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvblxuIik7Cj4+Pj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4+
Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJcmV0dXJuIDA7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gICAvKiBw
cm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gKi8KPj4+PiAgIHN0YXRpYyB2b2lkIHB2X2luaXQodm9p
ZCkKPj4+PiAgIHsKPj4+IFdoYXQgYm90aGVycyBtZSBoZXJlIGlzIHRoYXQgYXJjaCBjb2RlIGRl
cGVuZHMgb24gdmlydGlvIG5vdy4KPj4+IEl0IHdvcmtzIGV2ZW4gd2l0aCBhIG1vZHVsYXIgdmly
dGlvIHdoZW4gZnVuY3Rpb25zIGFyZSBpbmxpbmUsCj4+PiBidXQgaXQgc2VlbXMgZnJhZ2lsZTog
ZS5nLiBpdCBicmVha3MgdmlydGlvIGFzIGFuIG91dCBvZiB0cmVlIG1vZHVsZSwKPj4+IHNpbmNl
IGxheW91dCBvZiBzdHJ1Y3QgdmlydGlvX2RldmljZSBjYW4gY2hhbmdlLgo+PgoKSWYgeW91IHBy
ZWZlciB0aGF0LCB3ZSBjYW4gc2ltcGx5IGNyZWF0ZSBhbiBhcmNoL3MzOTAva2VybmVsL3ZpcnRp
by5jID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
