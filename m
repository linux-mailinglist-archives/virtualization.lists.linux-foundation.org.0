Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E12158A8
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 15:37:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D1D588C7F;
	Mon,  6 Jul 2020 13:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eAj5y6B1aEe; Mon,  6 Jul 2020 13:37:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6841E88C7E;
	Mon,  6 Jul 2020 13:37:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C866C016F;
	Mon,  6 Jul 2020 13:37:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF52C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 13:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 767DD25A72
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 13:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfDLV4j71vuW
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 13:37:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by silver.osuosl.org (Postfix) with ESMTPS id 908BA2036E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 13:37:48 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066DWac6149203; Mon, 6 Jul 2020 09:37:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322nx5m4ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 09:37:43 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 066DWhRl149913;
 Mon, 6 Jul 2020 09:37:43 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322nx5m4d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 09:37:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 066Daptr027619;
 Mon, 6 Jul 2020 13:37:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 322h1h2b6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 13:37:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 066DbclL43384854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 13:37:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CDEA5204E;
 Mon,  6 Jul 2020 13:37:38 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.49.44])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4B97452052;
 Mon,  6 Jul 2020 13:37:37 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
From: Pierre Morel <pmorel@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115651-mutt-send-email-mst@kernel.org>
 <20200629180526.41d0732b.cohuck@redhat.com>
 <26ecd4c6-837b-1ce6-170b-a0155e4dd4d4@linux.ibm.com>
Message-ID: <a677decc-5be3-8095-bc33-0f95634011f6@linux.ibm.com>
Date: Mon, 6 Jul 2020 15:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <26ecd4c6-837b-1ce6-170b-a0155e4dd4d4@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_11:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=957 lowpriorityscore=0
 mlxscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060104
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, heiko.carstens@de.ibm.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
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

CgpPbiAyMDIwLTA3LTAyIDE1OjAzLCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4gCj4gCj4gT24gMjAy
MC0wNi0yOSAxODowNSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPj4gT24gTW9uLCAyOSBKdW4gMjAy
MCAxMTo1NzoxNCAtMDQwMAo+PiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+
IHdyb3RlOgo+Pgo+Pj4gT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMTI6NDM6NTdQTSArMDIwMCwg
UGllcnJlIE1vcmVsIHdyb3RlOgo+Pj4+IEFuIGFyY2hpdGVjdHVyZSBwcm90ZWN0aW5nIHRoZSBn
dWVzdCBtZW1vcnkgYWdhaW5zdCB1bmF1dGhvcml6ZWQgaG9zdAo+Pj4+IGFjY2VzcyBtYXkgd2Fu
dCB0byBlbmZvcmNlIFZJUlRJTyBJL08gZGV2aWNlIHByb3RlY3Rpb24gdGhyb3VnaCB0aGUKPj4+
PiB1c2Ugb2YgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0uCj4+Pj4KPj4+PiBMZXQncyBnaXZlIGEg
Y2hhbmNlIHRvIHRoZSBhcmNoaXRlY3R1cmUgdG8gYWNjZXB0IG9yIG5vdCBkZXZpY2VzCj4+Pj4g
d2l0aG91dCBWSVJUSU9fRl9JT01NVV9QTEFURk9STS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+Cj4+Pj4gQWNrZWQtYnk6IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+Pj4gQWNrZWQtYnk6IENocmlzdGlhbiBCb3Ju
dHJhZWdlciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBhcmNoL3Mz
OTAvbW0vaW5pdC5jwqDCoMKgwqAgfMKgIDYgKysrKysrCj4+Pj4gwqAgZHJpdmVycy92aXJ0aW8v
dmlydGlvLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gwqAgaW5jbHVkZS9saW51
eC92aXJ0aW8uaMKgIHzCoCAyICsrCj4+Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRp
b25zKCspCj4+Cj4+Pj4gQEAgLTE3OSw2ICsxOTQsMTMgQEAgaW50IHZpcnRpb19maW5hbGl6ZV9m
ZWF0dXJlcyhzdHJ1Y3QgCj4+Pj4gdmlydGlvX2RldmljZSAqZGV2KQo+Pj4+IMKgwqDCoMKgwqAg
aWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9WRVJTSU9OXzEpKQo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+PiArwqDCoMKgIGlmIChhcmNoX25lZWRzX3Zp
cnRpb19pb21tdV9wbGF0Zm9ybShkZXYpICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKgICF2aXJ0aW9f
aGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9JT01NVV9QTEFURk9STSkpIHsKPj4+PiArwqDCoMKg
wqDCoMKgwqAgZGV2X3dhcm4oJmRldi0+ZGV2LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgInZpcnRpbzogZGV2aWNlIG11c3QgcHJvdmlkZSBWSVJUSU9fRl9JT01NVV9QTEFURk9STVxu
Iik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOwo+Pj4+ICvCoMKgwqAgfQo+
Pj4+ICsKPj4+PiDCoMKgwqDCoMKgIHZpcnRpb19hZGRfc3RhdHVzKGRldiwgVklSVElPX0NPTkZJ
R19TX0ZFQVRVUkVTX09LKTsKPj4+PiDCoMKgwqDCoMKgIHN0YXR1cyA9IGRldi0+Y29uZmlnLT5n
ZXRfc3RhdHVzKGRldik7Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoIShzdGF0dXMgJiBWSVJUSU9fQ09O
RklHX1NfRkVBVFVSRVNfT0spKSB7Cj4+Pgo+Pj4gV2VsbCBkb24ndCB5b3UgbmVlZCB0byBjaGVj
ayBpdCAqYmVmb3JlKiBWSVJUSU9fRl9WRVJTSU9OXzEsIG5vdCBhZnRlcj8KPj4KPj4gQnV0IGl0
J3Mgb25seSBhdmFpbGFibGUgd2l0aCBWRVJTSU9OXzEgYW55d2F5LCBpc24ndCBpdD8gU28gaXQg
cHJvYmFibHkKPj4gYWxzbyBuZWVkcyB0byBmYWlsIHdoZW4gdGhpcyBmZWF0dXJlIGlzIG5lZWRl
ZCBpZiBWRVJTSU9OXzEgaGFzIG5vdCBiZWVuCj4+IG5lZ290aWF0ZWQsIEkgdGhpbmsuCgoKd291
bGQgYmUgc29tZXRoaW5nIGxpa2U6CgotICAgICAgIGlmICghdmlydGlvX2hhc19mZWF0dXJlKGRl
diwgVklSVElPX0ZfVkVSU0lPTl8xKSkKLSAgICAgICAgICAgICAgIHJldHVybiAwOworICAgICAg
IGlmICghdmlydGlvX2hhc19mZWF0dXJlKGRldiwgVklSVElPX0ZfVkVSU0lPTl8xKSkgeworICAg
ICAgICAgICAgICAgcmV0ID0gYXJjaF9hY2NlcHRfdmlydGlvX2ZlYXR1cmVzKGRldik7CisgICAg
ICAgICAgICAgICBpZiAocmV0KQorICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybigmZGV2
LT5kZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ2aXJ0aW86IGRldmljZSBt
dXN0IHByb3ZpZGUgClZJUlRJT19GX1ZFUlNJT05fMVxuIik7CisgICAgICAgICAgICAgICByZXR1
cm4gcmV0OworICAgICAgIH0KCgpqdXN0IGEgdGhvdWdodCBvbiB0aGUgZnVuY3Rpb24gbmFtZToK
SXQgYmVjb21lcyBtb3JlIGdlbmVyYWwgdGhhbiBqdXN0IElPTU1VX1BMQVRGT1JNIHJlbGF0ZWQu
CgpXaGF0IGRvIHlvdSB0aGluayBvZjoKCmFyY2hfYWNjZXB0X3ZpcnRpb19mZWF0dXJlcygpCgo/
CgpSZWdhcmRzLApQaWVycmUKCgotLSAKUGllcnJlIE1vcmVsCklCTSBMYWIgQm9lYmxpbmdlbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
