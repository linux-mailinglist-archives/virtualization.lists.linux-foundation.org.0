Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9222330F7
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 13:32:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C59C186A42;
	Thu, 30 Jul 2020 11:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rGL-8Jk_kpl; Thu, 30 Jul 2020 11:32:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D89E186A54;
	Thu, 30 Jul 2020 11:32:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B129C0053;
	Thu, 30 Jul 2020 11:32:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C75AC004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 11:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EB245203D3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 11:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W7WIlTgt5zvQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 11:32:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id 7800D20115
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 11:32:19 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UBW5MM026230; Thu, 30 Jul 2020 07:32:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32kv5rj4q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 07:32:11 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06UBW9cu026634;
 Thu, 30 Jul 2020 07:32:11 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32kv5rj4hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 07:32:11 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UBKROE016839;
 Thu, 30 Jul 2020 11:31:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqgp3wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 11:31:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UBVrQT9568562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 11:31:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACC43520C9;
 Thu, 30 Jul 2020 11:31:51 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.51.62])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 893CB52133;
 Thu, 30 Jul 2020 11:31:20 +0000 (GMT)
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
 <20200715054807-mutt-send-email-mst@kernel.org>
 <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
 <20200715074917-mutt-send-email-mst@kernel.org>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <e41d039c-5fe2-b9db-093b-c0dddcc2ad4f@linux.ibm.com>
Date: Thu, 30 Jul 2020 13:31:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200715074917-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_09:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300082
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

CmdlbnRsZSBwaW5nLgoKCk9uIDIwMjAtMDctMTUgMTM6NTEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPiBPbiBXZWQsIEp1bCAxNSwgMjAyMCBhdCAwNjoxNjo1OVBNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDIwLzcvMTUg5LiL5Y2INTo1MCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+Pj4gT24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMTA6MzE6MDlBTSArMDIwMCwg
UGllcnJlIE1vcmVsIHdyb3RlOgo+Pj4+IElmIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbiBpcyBh
Y3RpdmUgb24gczM5MCwgdGhlIHZpcnRpbyBxdWV1ZXMgYXJlCj4+Pj4gbm90IGFjY2Vzc2libGUg
dG8gdGhlIGhvc3QsIHVubGVzcyBWSVJUSU9fRl9JT01NVV9QTEFURk9STSBoYXMgYmVlbgo+Pj4+
IG5lZ290aWF0ZWQuIFVzZSB0aGUgbmV3IGFyY2hfdmFsaWRhdGVfdmlydGlvX2ZlYXR1cmVzKCkg
aW50ZXJmYWNlIHRvCj4+Pj4gZmFpbCBwcm9iZSBpZiB0aGF0J3Mgbm90IHRoZSBjYXNlLCBwcmV2
ZW50aW5nIGEgaG9zdCBlcnJvciBvbiBhY2Nlc3MKPj4+PiBhdHRlbXB0Lgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogUGllcnJlIE1vcmVsIDxwbW9yZWxAbGludXguaWJtLmNvbT4KPj4+PiBSZXZp
ZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cj4+Pj4gQWNrZWQtYnk6
IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPgo+Pj4+IEFja2VkLWJ5OiBDaHJpc3Rp
YW4gQm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAg
YXJjaC9zMzkwL21tL2luaXQuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvczM5MC9tbS9pbml0LmMgYi9hcmNoL3MzOTAvbW0vaW5pdC5jCj4+Pj4gaW5kZXgg
NmRjN2MzYjYwZWY2Li5kMzlhZjY1NTRkNGYgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9zMzkwL21t
L2luaXQuYwo+Pj4+ICsrKyBiL2FyY2gvczM5MC9tbS9pbml0LmMKPj4+PiBAQCAtNDUsNiArNDUs
NyBAQAo+Pj4+ICAgICNpbmNsdWRlIDxhc20va2FzYW4uaD4KPj4+PiAgICAjaW5jbHVkZSA8YXNt
L2RtYS1tYXBwaW5nLmg+Cj4+Pj4gICAgI2luY2x1ZGUgPGFzbS91di5oPgo+Pj4+ICsjaW5jbHVk
ZSA8bGludXgvdmlydGlvX2NvbmZpZy5oPgo+Pj4+ICAgIHBnZF90IHN3YXBwZXJfcGdfZGlyW1BU
UlNfUEVSX1BHRF0gX19zZWN0aW9uKC5ic3MuLnN3YXBwZXJfcGdfZGlyKTsKPj4+PiBAQCAtMTYx
LDYgKzE2MiwzMyBAQCBib29sIGZvcmNlX2RtYV91bmVuY3J5cHRlZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4+Pj4gICAgCXJldHVybiBpc19wcm90X3ZpcnRfZ3Vlc3QoKTsKPj4+PiAgICB9Cj4+Pj4g
Ky8qCj4+Pj4gKyAqIGFyY2hfdmFsaWRhdGVfdmlydGlvX2ZlYXR1cmVzCj4+Pj4gKyAqIEBkZXY6
IHRoZSBWSVJUSU8gZGV2aWNlIGJlaW5nIGFkZGVkCj4+Pj4gKyAqCj4+Pj4gKyAqIFJldHVybiBh
biBlcnJvciBpZiByZXF1aXJlZCBmZWF0dXJlcyBhcmUgbWlzc2luZyBvbiBhIGd1ZXN0IHJ1bm5p
bmcKPj4+PiArICogd2l0aCBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24uCj4+Pj4gKyAqLwo+Pj4+
ICtpbnQgYXJjaF92YWxpZGF0ZV92aXJ0aW9fZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZpY2Ug
KmRldikKPj4+PiArewo+Pj4+ICsJaWYgKCFpc19wcm90X3ZpcnRfZ3Vlc3QoKSkKPj4+PiArCQly
ZXR1cm4gMDsKPj4+PiArCj4+Pj4gKwlpZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJ
T19GX1ZFUlNJT05fMSkpIHsKPj4+PiArCQlkZXZfd2FybigmZGV2LT5kZXYsCj4+Pj4gKwkJCSAi
bGVnYWN5IHZpcnRpbyBub3Qgc3VwcG9ydGVkIHdpdGggcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9u
XG4iKTsKPj4+PiArCQlyZXR1cm4gLUVOT0RFVjsKPj4+PiArCX0KPj4+PiArCj4+Pj4gKwlpZiAo
IXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSkgewo+Pj4+
ICsJCWRldl93YXJuKCZkZXYtPmRldiwKPj4+PiArCQkJICJzdXBwb3J0IGZvciBsaW1pdGVkIG1l
bW9yeSBhY2Nlc3MgcmVxdWlyZWQgZm9yIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvblxuIik7Cj4+
Pj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJcmV0dXJuIDA7Cj4+
Pj4gK30KPj4+PiArCj4+Pj4gICAgLyogcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uICovCj4+Pj4g
ICAgc3RhdGljIHZvaWQgcHZfaW5pdCh2b2lkKQo+Pj4+ICAgIHsKPj4+IFdoYXQgYm90aGVycyBt
ZSBoZXJlIGlzIHRoYXQgYXJjaCBjb2RlIGRlcGVuZHMgb24gdmlydGlvIG5vdy4KPj4+IEl0IHdv
cmtzIGV2ZW4gd2l0aCBhIG1vZHVsYXIgdmlydGlvIHdoZW4gZnVuY3Rpb25zIGFyZSBpbmxpbmUs
Cj4+PiBidXQgaXQgc2VlbXMgZnJhZ2lsZTogZS5nLiBpdCBicmVha3MgdmlydGlvIGFzIGFuIG91
dCBvZiB0cmVlIG1vZHVsZSwKPj4+IHNpbmNlIGxheW91dCBvZiBzdHJ1Y3QgdmlydGlvX2Rldmlj
ZSBjYW4gY2hhbmdlLgo+Pgo+Pgo+PiBUaGUgY29kZSB3YXMgb25seSBjYWxsZWQgZnJvbSB2aXJ0
aW8uYyBzbyBpdCBzaG91bGQgYmUgZmluZS4KPj4KPj4gQW5kIG15IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCB3ZSBkb24ndCBuZWVkIHRvIGNhcmUgYWJvdXQgdGhlIGtBQkkgaXNzdWUKPj4gZHVyaW5n
IHVwc3RyZWFtIGRldmVsb3BtZW50Pwo+Pgo+PiBUaGFua3MKPiAKPiBObywgYnV0IHNvIGZhciBp
dCBoYXMgYmVlbiBjb252ZW5pZW50IGF0IGxlYXN0IGZvciBtZSwgZm9yIGRldmVsb3BtZW50LAo+
IHRvIGp1c3QgYmUgYWJsZSB0byB1bmxvYWQgYWxsIG9mIHZpcnRpbyBhbmQgbG9hZCBhIGRpZmZl
cmVudCB2ZXJzaW9uLgo+IAo+IAo+Pgo+Pj4KPj4+IEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIHdp
dGggdGhpcyB5ZXQsIHdpbGwgdHJ5IHRvIHRoaW5rIGFib3V0IGl0Cj4+PiBvdmVyIHRoZSB3ZWVr
ZW5kLiBUaGFua3MhCj4+Pgo+Pj4KPj4+PiAtLSAKPj4+PiAyLjI1LjEKPiAKCi0tIApQaWVycmUg
TW9yZWwKSUJNIExhYiBCb2VibGluZ2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
