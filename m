Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB022747
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:23:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF663C2C;
	Sun, 19 May 2019 16:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6FABC3F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0EF7442D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:15:11 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4FEDLfn091932 for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 10:15:11 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sgjgwqb53-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 10:15:11 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Wed, 15 May 2019 15:15:08 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 15 May 2019 15:15:06 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4FEF4Y048693364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 15 May 2019 14:15:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C3DF52051;
	Wed, 15 May 2019 14:15:04 +0000 (GMT)
Received: from [9.152.99.219] (unknown [9.152.99.219])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AF43C52050;
	Wed, 15 May 2019 14:15:03 +0000 (GMT)
Subject: Re: [PATCH 04/10] s390/mm: force swiotlb for protected virtualization
To: Halil Pasic <pasic@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-5-pasic@linux.ibm.com>
	<20190508151540.14ba1d90@p-imbrenda.boeblingen.de.ibm.com>
	<20190510003401.4254f200.pasic@linux.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Wed, 15 May 2019 16:15:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510003401.4254f200.pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051514-0012-0000-0000-0000031BFF88
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051514-0013-0000-0000-000021549CFD
Message-Id: <cfb14388-15ed-afe3-f0a7-6cb384e73995@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905150088
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	kvm@vger.kernel.org, Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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
Reply-To: mimu@linux.ibm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

CgpPbiAxMC4wNS4xOSAwMDozNCwgSGFsaWwgUGFzaWMgd3JvdGU6Cj4gT24gV2VkLCA4IE1heSAy
MDE5IDE1OjE1OjQwICswMjAwCj4gQ2xhdWRpbyBJbWJyZW5kYSA8aW1icmVuZGFAbGludXguaWJt
LmNvbT4gd3JvdGU6Cj4gCj4+IE9uIEZyaSwgMjYgQXByIDIwMTkgMjA6MzI6MzkgKzAyMDAKPj4g
SGFsaWwgUGFzaWMgPHBhc2ljQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+Pgo+Pj4gT24gczM5MCwg
cHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uIGd1ZXN0cyBoYXZlIHRvIHVzZSBib3VuY2VkIEkvTwo+
Pj4gYnVmZmVycy4gIFRoYXQgcmVxdWlyZXMgc29tZSBwbHVtYmluZy4KPj4+Cj4+PiBMZXQgdXMg
bWFrZSBzdXJlLCBhbnkgZGV2aWNlIHRoYXQgdXNlcyBETUEgQVBJIHdpdGggZGlyZWN0IG9wcwo+
Pj4gY29ycmVjdGx5IGlzIHNwYXJlZCBmcm9tIHRoZSBwcm9ibGVtcywgdGhhdCBhIGh5cGVydmlz
b3IgYXR0ZW1wdGluZwo+Pj4gSS9PIHRvIGEgbm9uLXNoYXJlZCBwYWdlIHdvdWxkIGJyaW5nLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPgo+
Pj4gLS0tCj4+PiAgIGFyY2gvczM5MC9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgIDQgKysr
Cj4+PiAgIGFyY2gvczM5MC9pbmNsdWRlL2FzbS9tZW1fZW5jcnlwdC5oIHwgMTggKysrKysrKysr
KysrKwo+Pj4gICBhcmNoL3MzOTAvbW0vaW5pdC5jICAgICAgICAgICAgICAgICB8IDUwCj4+PiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrIDMgZmlsZXMgY2hhbmdlZCwgNzIK
Pj4+IGluc2VydGlvbnMoKykgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvczM5MC9pbmNsdWRlL2Fz
bS9tZW1fZW5jcnlwdC5oCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9LY29uZmlnIGIv
YXJjaC9zMzkwL0tjb25maWcKPj4+IGluZGV4IDFjM2ZjZjE5YzNhZi4uNTUwMGQwNWQ0ZDUzIDEw
MDY0NAo+Pj4gLS0tIGEvYXJjaC9zMzkwL0tjb25maWcKPj4+ICsrKyBiL2FyY2gvczM5MC9LY29u
ZmlnCj4+PiBAQCAtMSw0ICsxLDcgQEAKPj4+ICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAo+Pj4gK2NvbmZpZyBBUkNIX0hBU19NRU1fRU5DUllQVAo+Pj4gKyAgICAgICAgZGVm
X2Jvb2wgeQo+Pj4gKwo+Pj4gICBjb25maWcgTU1VCj4+PiAgIAlkZWZfYm9vbCB5Cj4+PiAgIAo+
Pj4gQEAgLTE5MSw2ICsxOTQsNyBAQCBjb25maWcgUzM5MAo+Pj4gICAJc2VsZWN0IEFSQ0hfSEFT
X1NDQUxFRF9DUFVUSU1FCj4+PiAgIAlzZWxlY3QgVklSVF9UT19CVVMKPj4+ICAgCXNlbGVjdCBI
QVZFX05NSQo+Pj4gKwlzZWxlY3QgU1dJT1RMQgo+Pj4gICAKPj4+ICAgCj4+PiAgIGNvbmZpZyBT
Q0hFRF9PTUlUX0ZSQU1FX1BPSU5URVIKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5jbHVk
ZS9hc20vbWVtX2VuY3J5cHQuaAo+Pj4gYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vbWVtX2VuY3J5
cHQuaCBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wODk4YzA5
YTg4OGMKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9t
ZW1fZW5jcnlwdC5oCj4+PiBAQCAtMCwwICsxLDE4IEBACj4+PiArLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4+ICsjaWZuZGVmIFMzOTBfTUVNX0VOQ1JZUFRfSF9fCj4+
PiArI2RlZmluZSBTMzkwX01FTV9FTkNSWVBUX0hfXwo+Pj4gKwo+Pj4gKyNpZm5kZWYgX19BU1NF
TUJMWV9fCj4+PiArCj4+PiArI2RlZmluZSBzbWVfbWVfbWFzawkwVUxMCj4+Cj4+IFRoaXMgaXMg
cmF0aGVyIHVnbHksIGJ1dCBJIHVuZGVyc3RhbmQgd2h5IGl0J3MgdGhlcmUKPj4KPiAKPiBOb2Qu
Cj4gCj4+PiArCj4+PiArc3RhdGljIGlubGluZSBib29sIHNtZV9hY3RpdmUodm9pZCkgeyByZXR1
cm4gZmFsc2U7IH0KPj4+ICtleHRlcm4gYm9vbCBzZXZfYWN0aXZlKHZvaWQpOwo+Pj4gKwo+Pj4g
K2ludCBzZXRfbWVtb3J5X2VuY3J5cHRlZCh1bnNpZ25lZCBsb25nIGFkZHIsIGludCBudW1wYWdl
cyk7Cj4+PiAraW50IHNldF9tZW1vcnlfZGVjcnlwdGVkKHVuc2lnbmVkIGxvbmcgYWRkciwgaW50
IG51bXBhZ2VzKTsKPj4+ICsKPj4+ICsjZW5kaWYJLyogX19BU1NFTUJMWV9fICovCj4+PiArCj4+
PiArI2VuZGlmCS8qIFMzOTBfTUVNX0VOQ1JZUFRfSF9fICovCj4+PiArCj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL21tL2luaXQuYyBiL2FyY2gvczM5MC9tbS9pbml0LmMKPj4+IGluZGV4IDNl
ODJmNjZkNWM2MS4uN2UzY2JkMTVkY2ZhIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9zMzkwL21tL2lu
aXQuYwo+Pj4gKysrIGIvYXJjaC9zMzkwL21tL2luaXQuYwo+Pj4gQEAgLTE4LDYgKzE4LDcgQEAK
Pj4+ICAgI2luY2x1ZGUgPGxpbnV4L21tYW4uaD4KPj4+ICAgI2luY2x1ZGUgPGxpbnV4L21tLmg+
Cj4+PiAgICNpbmNsdWRlIDxsaW51eC9zd2FwLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3N3aW90
bGIuaD4KPj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+Pj4gICAjaW5jbHVkZSA8bGludXgv
aW5pdC5oPgo+Pj4gICAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgo+Pj4gQEAgLTI5LDYgKzMw
LDcgQEAKPj4+ICAgI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+Pj4gICAjaW5jbHVkZSA8bGlu
dXgvY21hLmg+Cj4+PiAgICNpbmNsdWRlIDxsaW51eC9nZnAuaD4KPj4+ICsjaW5jbHVkZSA8bGlu
dXgvZG1hLW1hcHBpbmcuaD4KPj4+ICAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPj4+ICAg
I2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPj4+ICAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+
Cj4+PiBAQCAtNDIsNiArNDQsOCBAQAo+Pj4gICAjaW5jbHVkZSA8YXNtL3NjbHAuaD4KPj4+ICAg
I2luY2x1ZGUgPGFzbS9zZXRfbWVtb3J5Lmg+Cj4+PiAgICNpbmNsdWRlIDxhc20va2FzYW4uaD4K
Pj4+ICsjaW5jbHVkZSA8YXNtL2RtYS1tYXBwaW5nLmg+Cj4+PiArI2luY2x1ZGUgPGFzbS91di5o
Pgo+Pj4gICAKPj4+ICAgcGdkX3Qgc3dhcHBlcl9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX3NlY3Rp
b24oLmJzcy4uc3dhcHBlcl9wZ19kaXIpOwo+Pj4gICAKPj4+IEBAIC0xMjYsNiArMTMwLDUwIEBA
IHZvaWQgbWFya19yb2RhdGFfcm8odm9pZCkKPj4+ICAgCXByX2luZm8oIldyaXRlIHByb3RlY3Rl
ZCByZWFkLW9ubHktYWZ0ZXItaW5pdCBkYXRhOiAlbHVrXG4iLAo+Pj4gc2l6ZSA+PiAxMCk7IH0K
Pj4+ICAgCj4+PiAraW50IHNldF9tZW1vcnlfZW5jcnlwdGVkKHVuc2lnbmVkIGxvbmcgYWRkciwg
aW50IG51bXBhZ2VzKQo+Pj4gK3sKPj4+ICsJaW50IGk7Cj4+PiArCj4+PiArCS8qIG1ha2UgYWxs
IHBhZ2VzIHNoYXJlZCwgKHN3aW90bGIsIGRtYV9mcmVlKSAqLwo+Pgo+PiB0aGlzIGlzIGEgY29w
eXBhc3RlIHR5cG8sIEkgdGhpbms/IChzaG91bGQgYmUgVU5zaGFyZWQ/KQo+PiBhbHNvLCBpdCBk
b2Vzbid0IG1ha2UgQUxMIHBhZ2VzIHVuc2hhcmVkLCBidXQgb25seSB0aG9zZSBzcGVjaWZpZWQg
aW4KPj4gdGhlIHBhcmFtZXRlcnMKPiAKPiBSaWdodCBhIGNvcHkgcGFzdGUgZXJyb3IuIE5lZWRz
IGNvcnJlY3Rpb24uIFRoZSBhbGwgd2FzIG1lYW50IGxpa2UgYWxsCj4gcGFnZXMgaW4gdGhlIHJh
bmdlIHNwZWNpZmllZCBieSB0aGUgYXJndW1lbnRzLiBCdXQgaXQgaXMgYmV0dGVyIGNoYW5nZWQK
PiBzaW5jZSBpdCB0dXJuZWQgb3V0IHRvIGJlIGNvbmZ1c2luZy4KPiAKPj4KPj4gd2l0aCB0aGlz
IGZpeGVkOgo+PiBSZXZpZXdlZC1ieTogQ2xhdWRpbyBJbWJyZW5kYSA8aW1icmVuZGFAbGludXgu
aWJtLmNvbT4KPj4KPiAKPiBUaGFua3MhCj4gCj4+PiArCWZvciAoaSA9IDA7IGkgPCBudW1wYWdl
czsgKytpKSB7Cj4+PiArCQl1dl9yZW1vdmVfc2hhcmVkKGFkZHIpOwo+Pj4gKwkJYWRkciArPSBQ
QUdFX1NJWkU7Cj4+PiArCX0KPj4+ICsJcmV0dXJuIDA7Cj4+PiArfQo+Pj4gK0VYUE9SVF9TWU1C
T0xfR1BMKHNldF9tZW1vcnlfZW5jcnlwdGVkKTsKPj4+ICsKPj4+ICtpbnQgc2V0X21lbW9yeV9k
ZWNyeXB0ZWQodW5zaWduZWQgbG9uZyBhZGRyLCBpbnQgbnVtcGFnZXMpCj4+PiArewo+Pj4gKwlp
bnQgaTsKPj4+ICsJLyogbWFrZSBhbGwgcGFnZXMgc2hhcmVkIChzd2lvdGxiLCBkbWFfYWxsb2Nh
KSAqLwo+Pgo+PiBzYW1lIGhlcmUgd2l0aCBBTEwKPj4KPj4+ICsJZm9yIChpID0gMDsgaSA8IG51
bXBhZ2VzOyArK2kpIHsKPj4+ICsJCXV2X3NldF9zaGFyZWQoYWRkcik7Cj4+PiArCQlhZGRyICs9
IFBBR0VfU0laRTsKPj4+ICsJfQo+Pj4gKwlyZXR1cm4gMDsKPj4+ICt9Cj4+PiArRVhQT1JUX1NZ
TUJPTF9HUEwoc2V0X21lbW9yeV9kZWNyeXB0ZWQpOwo+Pj4gKwo+Pj4gKy8qIGFyZSB3ZSBhIHBy
b3RlY3RlZCB2aXJ0dWFsaXphdGlvbiBndWVzdD8gKi8KPj4+ICtib29sIHNldl9hY3RpdmUodm9p
ZCkKPj4KPj4gdGhpcyBpcyBhbHNvIHVnbHkuIHRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkIGJl
IHByb2JhYmx5IHRvIHJlZmFjdG9yCj4+IGV2ZXJ5dGhpbmcsIGluY2x1ZGluZyBhbGwgdGhlIEFN
RCBTRVYgY29kZS4uLi4gbGV0J3Mgbm90IGdvIHRoZXJlCj4+Cj4gCj4gTm9kLiBNYXliZSBsYXRl
ci4KPiAKPj4+ICt7Cj4+PiArCXJldHVybiBpc19wcm90X3ZpcnRfZ3Vlc3QoKTsKPj4+ICt9Cj4+
PiArRVhQT1JUX1NZTUJPTF9HUEwoc2V2X2FjdGl2ZSk7Cj4+PiArCj4+PiArLyogcHJvdGVjdGVk
IHZpcnR1YWxpemF0aW9uICovCj4+PiArc3RhdGljIHZvaWQgcHZfaW5pdCh2b2lkKQo+Pj4gK3sK
Pj4+ICsJaWYgKCFzZXZfYWN0aXZlKCkpCj4+Cj4+IGNhbid0IHlvdSBqdXN0IHVzZSBpc19wcm90
X3ZpcnRfZ3Vlc3QgaGVyZT8KPj4KPiAKPiBTdXJlISBJIGd1ZXNzIGl0IHdvdWxkIGJlIGxlc3Mg
Y29uZnVzaW5nLiBJdCBpcyBzb21ldGhpbmcgSSBkaWQgbm90Cj4gcmVtZW1iZXIgdG8gY2hhbmdl
IHdoZW4gdGhlIGludGVyZmFjZSBmb3IgdGhpcyBwcm92aWRlZCBieSB1di5oIHdlbnQKPiBmcm9t
IHNrZXRjaHkgdG8gbmljZS4KCmludGVncmF0ZWQgaW4gdjIKCk1pY2hhZWwKCj4gCj4gVGhhbmtz
IGFnYWluIQo+IAo+IFJlZ2FyZHMsCj4gSGFsaWwKPiAKPj4+ICsJCXJldHVybjsKPj4+ICsKPj4+
ICsJLyogbWFrZSBzdXJlIGJvdW5jZSBidWZmZXJzIGFyZSBzaGFyZWQgKi8KPj4+ICsJc3dpb3Rs
Yl9pbml0KDEpOwo+Pj4gKwlzd2lvdGxiX3VwZGF0ZV9tZW1fYXR0cmlidXRlcygpOwo+Pj4gKwlz
d2lvdGxiX2ZvcmNlID0gU1dJT1RMQl9GT1JDRTsKPj4+ICt9Cj4+PiArCj4+PiAgIHZvaWQgX19p
bml0IG1lbV9pbml0KHZvaWQpCj4+PiAgIHsKPj4+ICAgCWNwdW1hc2tfc2V0X2NwdSgwLCAmaW5p
dF9tbS5jb250ZXh0LmNwdV9hdHRhY2hfbWFzayk7Cj4+PiBAQCAtMTM0LDYgKzE4Miw4IEBAIHZv
aWQgX19pbml0IG1lbV9pbml0KHZvaWQpCj4+PiAgIAlzZXRfbWF4X21hcG5yKG1heF9sb3dfcGZu
KTsKPj4+ICAgICAgICAgICBoaWdoX21lbW9yeSA9ICh2b2lkICopIF9fdmEobWF4X2xvd19wZm4g
KiBQQUdFX1NJWkUpOwo+Pj4gICAKPj4+ICsJcHZfaW5pdCgpOwo+Pj4gKwo+Pj4gICAJLyogU2V0
dXAgZ3Vlc3QgcGFnZSBoaW50aW5nICovCj4+PiAgIAljbW1hX2luaXQoKTsKPj4+ICAgCj4+Cj4g
CgotLSAKTWl0IGZyZXVuZGxpY2hlbiBHcsO8w59lbiAvIEtpbmQgcmVnYXJkcwpNaWNoYWVsIE3D
vGxsZXIKCklCTSBEZXV0c2NobGFuZCBSZXNlYXJjaCAmIERldmVsb3BtZW50IEdtYkgKVm9yc2l0
emVuZGVyIGRlcyBBdWZzaWNodHNyYXRzOiBNYXR0aGlhcyBIYXJ0bWFubgpHZXNjaMOkZnRzZsO8
aHJ1bmc6IERpcmsgV2l0dGtvcHAKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBCw7ZibGluZ2VuClJl
Z2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQgU3R1dHRnYXJ0LCBIUkIgMjQzMjk0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
