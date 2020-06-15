Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA30D1F9591
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 13:50:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6451288912;
	Mon, 15 Jun 2020 11:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnJC5aW8lsj7; Mon, 15 Jun 2020 11:50:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBE00888B6;
	Mon, 15 Jun 2020 11:50:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 956B0C089E;
	Mon, 15 Jun 2020 11:50:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3B42C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 992D987821
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGHEcxz13P7y
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:50:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CD8DC87F63
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:50:03 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FBg3T5127084; Mon, 15 Jun 2020 07:50:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31p5eud4n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 07:50:02 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FA3w7v187985;
 Mon, 15 Jun 2020 07:50:02 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31p5eud4kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 07:50:01 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FBjlpH005231;
 Mon, 15 Jun 2020 11:49:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 31mpe89dj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:49:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05FBntha59507018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 11:49:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E389AE058;
 Mon, 15 Jun 2020 11:49:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A334AE045;
 Mon, 15 Jun 2020 11:49:55 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.1.141])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 11:49:55 +0000 (GMT)
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
To: Halil Pasic <pasic@linux.ibm.com>, Jason Wang <jasowang@redhat.com>
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
 <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
 <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
 <6356ba7f-afab-75e1-05ff-4a22b88c610e@linux.ibm.com>
 <a02b9f94-eb48-4ae2-0ade-a4ce26b61ad8@redhat.com>
 <20200615123725.13f6a8de.pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <96a236da-7165-b59b-e013-919554fb1ac4@linux.ibm.com>
Date: Mon, 15 Jun 2020 13:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615123725.13f6a8de.pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 adultscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006150082
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, borntraeger@de.ibm.com
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

CgpPbiAyMDIwLTA2LTE1IDEyOjM3LCBIYWxpbCBQYXNpYyB3cm90ZToKPiBPbiBNb24sIDE1IEp1
biAyMDIwIDExOjAxOjU1ICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gCj4+PiBodW0sIGluIGJldHdlZW4gSSBmb3VuZCBhbm90aGVyIHdheSB3aGljaCBz
ZWVtcyB0byBtZSBtdWNoIGJldHRlcjoKPj4+Cj4+PiBXZSBhbHJlYWR5IGhhdmUgdGhlIGZvcmNl
X2RtYV91bmVuY3J5cHRlZCgpIGZ1bmN0aW9uIGF2YWlsYWJsZSB3aGljaAo+Pj4gQUZBSVUgaXMg
d2hhdCB3ZSB3YW50IGZvciBlbmNyeXB0ZWQgbWVtb3J5IHByb3RlY3Rpb24gYW5kIGlzIGFscmVh
ZHkKPj4+IHVzZWQgYnkgcG93ZXIgYW5kIHg4NiBTRVYvU01FIGluIGEgd2F5IHRoYXQgc2VlbXMg
QUZBSVUgY29tcGF0aWJsZQo+Pj4gd2l0aCBvdXIgcHJvYmxlbS4KPj4+Cj4+PiBFdmVuIERNQSBh
bmQgSU9NTVUgYXJlIGRpZmZlcmVudCB0aGluZ3MsIEkgdGhpbmsgdGhleSBzaG91bGQgYmUgdXNl
ZAo+Pj4gdG9nZXRoZXIgaW4gb3VyIGNhc2UuCj4+Pgo+Pj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+
Pgo+Pj4gVGhlIHBhdGNoIHdvdWxkIHRoZW4gYmUgc29tZXRoaW5nIGxpa2U6Cj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpby5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlv
LmMKPj4+IGluZGV4IGE5NzdlMzJhODhmMi4uNTM0NzZkNWJiZTM1IDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy92aXJ0aW8vdmlydGlvLmMKPj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpby5j
Cj4+PiBAQCAtNCw2ICs0LDcgQEAKPj4+ICDCoCNpbmNsdWRlIDxsaW51eC92aXJ0aW9fY29uZmln
Lmg+Cj4+PiAgwqAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+PiAgwqAjaW5jbHVkZSA8bGlu
dXgvaWRyLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1kaXJlY3QuaD4KPj4+ICDCoCNpbmNs
dWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19pZHMuaD4KPj4+Cj4+PiAgwqAvKiBVbmlxdWUgbnVtYmVy
aW5nIGZvciB2aXJ0aW8gZGV2aWNlcy4gKi8KPj4+IEBAIC0xNzksNiArMTgwLDEwIEBAIGludCB2
aXJ0aW9fZmluYWxpemVfZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZpY2UKPj4+ICpkZXYpCj4+
PiAgwqDCoMKgwqDCoMKgwqAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9W
RVJTSU9OXzEpKQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsK
Pj4+Cj4+PiArwqDCoMKgwqDCoMKgIGlmIChmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoJmRldi0+ZGV2
KSAmJgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgICF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBW
SVJUSU9fRl9JT01NVV9QTEFURk9STSkpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVJTzsKPj4+ICsKPj4+ICDCoMKgwqDCoMKgwqDCoCB2aXJ0aW9fYWRkX3N0YXR1
cyhkZXYsIFZJUlRJT19DT05GSUdfU19GRUFUVVJFU19PSyk7Cj4+PiAgwqDCoMKgwqDCoMKgwqAg
c3RhdHVzID0gZGV2LT5jb25maWctPmdldF9zdGF0dXMoZGV2KTsKPj4+ICDCoMKgwqDCoMKgwqDC
oCBpZiAoIShzdGF0dXMgJiBWSVJUSU9fQ09ORklHX1NfRkVBVFVSRVNfT0spKSB7Cj4+Cj4+Cj4+
IEkgdGhpbmsgdGhpcyBjYW4gd29yayBidXQgbmVlZCB0byBsaXN0ZW4gZnJvbSBNaWNoYWVsCj4g
Cj4gSSBkb24ndCB0aGluayBDaHJpc3RvcGggSGVsbHdpZyB3aWxsIGxpa2UgZm9yY2VfZG1hX3Vu
ZW5jcnlwdGVkKCkKPiBpbiB2aXJ0aW8gY29kZToKPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAy
MC8yLzIwLzYzMAo+IAo+IFJlZ2FyZHMsCj4gSGFsaWwKPiAKCk9LLCB0aGVuIGJhY2sgdG8gdGhl
IGZpcnN0IGlkZWEuClRoYW5rcywKClBpZXJyZQoKLS0gClBpZXJyZSBNb3JlbApJQk0gTGFiIEJv
ZWJsaW5nZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
