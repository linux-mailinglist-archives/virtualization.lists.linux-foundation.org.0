Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC0F22745
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:23:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 368158DC;
	Sun, 19 May 2019 16:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B2E39B8F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 13:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1D4C982C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 13:33:12 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4FDJoHW090758 for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 09:33:11 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sgk1yawq1-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 09:33:11 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Wed, 15 May 2019 14:33:09 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 15 May 2019 14:33:05 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4FDX3sX46792874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 15 May 2019 13:33:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E3575204F;
	Wed, 15 May 2019 13:33:03 +0000 (GMT)
Received: from [9.152.99.219] (unknown [9.152.99.219])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A73E95204E;
	Wed, 15 May 2019 13:33:02 +0000 (GMT)
Subject: Re: [PATCH 10/10] virtio/s390: make airq summary indicators DMA
To: pmorel@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	Cornelia Huck <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-11-pasic@linux.ibm.com>
	<74ff9a63-891a-7e24-0865-8cc91a95cada@linux.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Wed, 15 May 2019 15:33:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <74ff9a63-891a-7e24-0865-8cc91a95cada@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051513-0008-0000-0000-000002E6F805
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051513-0009-0000-0000-0000225397AC
Message-Id: <7c21b646-df27-88b6-6b06-3aab7887ff0a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905150085
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>
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

CgpPbiAwOC4wNS4xOSAxNzoxMSwgUGllcnJlIE1vcmVsIHdyb3RlOgo+IE9uIDI2LzA0LzIwMTkg
MjA6MzIsIEhhbGlsIFBhc2ljIHdyb3RlOgo+PiBIeXBlcnZpc29yIG5lZWRzIHRvIGludGVyYWN0
IHdpdGggdGhlIHN1bW1hcnkgaW5kaWNhdG9ycywgc28gdGhlc2UKPj4gbmVlZCB0byBiZSBETUEg
bWVtb3J5IGFzIHdlbGwgKGF0IGxlYXN0IGZvciBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24KPj4g
Z3Vlc3RzKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFsaWwgUGFzaWMgPHBhc2ljQGxpbnV4Lmli
bS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYyB8IDI0
ICsrKysrKysrKysrKysrKysrLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC92
aXJ0aW8vdmlydGlvX2Njdy5jIAo+PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5j
Cj4+IGluZGV4IDYxM2IxODAwMWEwYy4uNjA1OGIwN2ZlYTA4IDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+PiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlv
L3ZpcnRpb19jY3cuYwo+PiBAQCAtMTQwLDExICsxNDAsMTcgQEAgc3RhdGljIGludCB2aXJ0aW9f
Y2N3X3VzZV9haXJxID0gMTsKPj4gwqAgc3RydWN0IGFpcnFfaW5mbyB7Cj4+IMKgwqDCoMKgwqAg
cndsb2NrX3QgbG9jazsKPj4gLcKgwqDCoCB1OCBzdW1tYXJ5X2luZGljYXRvcjsKPj4gK8KgwqDC
oCB1OCBzdW1tYXJ5X2luZGljYXRvcl9pZHg7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFpcnFfc3Ry
dWN0IGFpcnE7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFpcnFfaXYgKmFpdjsKPj4gwqAgfTsKPj4g
wqAgc3RhdGljIHN0cnVjdCBhaXJxX2luZm8gKmFpcnFfYXJlYXNbTUFYX0FJUlFfQVJFQVNdOwo+
PiArc3RhdGljIHU4ICpzdW1tYXJ5X2luZGljYXRvcnM7Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUg
dTggKmdldF9zdW1tYXJ5X2luZGljYXRvcihzdHJ1Y3QgYWlycV9pbmZvICppbmZvKQo+PiArewo+
PiArwqDCoMKgIHJldHVybiBzdW1tYXJ5X2luZGljYXRvcnMgKyBpbmZvLT5zdW1tYXJ5X2luZGlj
YXRvcl9pZHg7Cj4+ICt9Cj4+IMKgICNkZWZpbmUgQ0NXX0NNRF9TRVRfVlEgMHgxMwo+PiDCoCAj
ZGVmaW5lIENDV19DTURfVkRFVl9SRVNFVCAweDMzCj4+IEBAIC0yMjUsNyArMjMxLDcgQEAgc3Rh
dGljIHZvaWQgdmlydGlvX2FpcnFfaGFuZGxlcihzdHJ1Y3QgYWlycV9zdHJ1Y3QgCj4+ICphaXJx
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHZyaW5nX2ludGVycnVwdCgwLCAodm9pZCAqKWFpcnFfaXZfZ2V0X3B0cihpbmZvLT5haXYs
IGFpKSk7Cj4+IMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgIGluZm8tPnN1bW1hcnlfaW5kaWNhdG9y
ID0gMDsKPj4gK8KgwqDCoCAqKGdldF9zdW1tYXJ5X2luZGljYXRvcihpbmZvKSkgPSAwOwo+PiDC
oMKgwqDCoMKgIHNtcF93bWIoKTsKPj4gwqDCoMKgwqDCoCAvKiBXYWxrIHRocm91Z2ggaW5kaWNh
dG9ycyBmaWVsZCwgc3VtbWFyeSBpbmRpY2F0b3Igbm90IGFjdGl2ZS4gKi8KPj4gwqDCoMKgwqDC
oCBmb3IgKGFpID0gMDs7KSB7Cj4+IEBAIC0yMzcsNyArMjQzLDggQEAgc3RhdGljIHZvaWQgdmly
dGlvX2FpcnFfaGFuZGxlcihzdHJ1Y3QgYWlycV9zdHJ1Y3QgCj4+ICphaXJxKQo+PiDCoMKgwqDC
oMKgIHJlYWRfdW5sb2NrKCZpbmZvLT5sb2NrKTsKPj4gwqAgfQo+PiAtc3RhdGljIHN0cnVjdCBh
aXJxX2luZm8gKm5ld19haXJxX2luZm8odm9pZCkKPj4gKy8qIGNhbGwgd2l0aCBhaXJxX2FyZWFz
X2xvY2sgaGVsZCAqLwo+PiArc3RhdGljIHN0cnVjdCBhaXJxX2luZm8gKm5ld19haXJxX2luZm8o
aW50IGluZGV4KQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFpcnFfaW5mbyAqaW5mbzsK
Pj4gwqDCoMKgwqDCoCBpbnQgcmM7Cj4+IEBAIC0yNTIsNyArMjU5LDggQEAgc3RhdGljIHN0cnVj
dCBhaXJxX2luZm8gKm5ld19haXJxX2luZm8odm9pZCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBOVUxMOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBpbmZvLT5haXJxLmhhbmRs
ZXIgPSB2aXJ0aW9fYWlycV9oYW5kbGVyOwo+PiAtwqDCoMKgIGluZm8tPmFpcnEubHNpX3B0ciA9
ICZpbmZvLT5zdW1tYXJ5X2luZGljYXRvcjsKPj4gK8KgwqDCoCBpbmZvLT5zdW1tYXJ5X2luZGlj
YXRvcl9pZHggPSBpbmRleDsKPj4gK8KgwqDCoCBpbmZvLT5haXJxLmxzaV9wdHIgPSBnZXRfc3Vt
bWFyeV9pbmRpY2F0b3IoaW5mbyk7Cj4+IMKgwqDCoMKgwqAgaW5mby0+YWlycS5sc2lfbWFzayA9
IDB4ZmY7Cj4+IMKgwqDCoMKgwqAgaW5mby0+YWlycS5pc2MgPSBWSVJUSU9fQUlSUV9JU0M7Cj4+
IMKgwqDCoMKgwqAgcmMgPSByZWdpc3Rlcl9hZGFwdGVyX2ludGVycnVwdCgmaW5mby0+YWlycSk7
Cj4+IEBAIC0yNzMsOCArMjgxLDkgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZ2V0X2FpcnFfaW5k
aWNhdG9yKHN0cnVjdCAKPj4gdmlydHF1ZXVlICp2cXNbXSwgaW50IG52cXMsCj4+IMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBiaXQsIGZsYWdzOwo+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkg
PCBNQVhfQUlSUV9BUkVBUyAmJiAhaW5kaWNhdG9yX2FkZHI7IGkrKykgewo+PiArwqDCoMKgwqDC
oMKgwqAgLyogVE9ETzogdGhpcyBzZWVtcyB0byBiZSByYWN5ICovCj4gCj4geWVzLCBteSBvcGlu
aW9ucyB0b28sIHdhcyBhbHJlYWR5IHJhY3ksIGluIG15IG9waW5pb24sIHdlIG5lZWQgYW5vdGhl
ciAKPiBwYXRjaCBpbiBhbm90aGVyIHNlcmllcyB0byBmaXggdGhpcy4KPiAKPiBIb3dldmVyLCBu
b3Qgc3VyZSBhYm91dCB0aGUgY29tbWVudC4KCkkgd2lsbCBkcm9wIHRoaXMgY29tbWVudCBmb3Ig
djIgb2YgdGhpcyBwYXRjaCBzZXJpZXMuCldlIHNoYWxsIGZpeCB0aGUgcmFjZSB3aXRoIGEgc2Vw
YXJhdGUgcGF0Y2guCgpNaWNoYWVsCgo+IAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhaXJx
X2FyZWFzW2ldKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhaXJxX2FyZWFzW2ldID0gbmV3
X2FpcnFfaW5mbygpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhaXJxX2FyZWFzW2ldID0g
bmV3X2FpcnFfaW5mbyhpKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGluZm8gPSBhaXJxX2FyZWFz
W2ldOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpbmZvKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gQEAgLTM1OSw3ICszNjgsNyBAQCBzdGF0aWMgdm9pZCB2
aXJ0aW9fY2N3X2Ryb3BfaW5kaWNhdG9yKHN0cnVjdCAKPj4gdmlydGlvX2Njd19kZXZpY2UgKnZj
ZGV2LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCF0aGluaW50X2FyZWEpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRoaW5pbnRf
YXJlYS0+c3VtbWFyeV9pbmRpY2F0b3IgPQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodW5z
aWduZWQgbG9uZykgJmFpcnFfaW5mby0+c3VtbWFyeV9pbmRpY2F0b3I7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25nKSBnZXRfc3VtbWFyeV9pbmRpY2F0b3IoYWlycV9p
bmZvKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRoaW5pbnRfYXJlYS0+aXNjID0gVklSVElPX0FJ
UlFfSVNDOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3LT5jbWRfY29kZSA9IENDV19DTURfU0VU
X0lORF9BREFQVEVSOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9IHNpemVvZigq
dGhpbmludF9hcmVhKTsKPj4gQEAgLTYyNCw3ICs2MzMsNyBAQCBzdGF0aWMgaW50IHZpcnRpb19j
Y3dfcmVnaXN0ZXJfYWRhcHRlcl9pbmQoc3RydWN0IAo+PiB2aXJ0aW9fY2N3X2RldmljZSAqdmNk
ZXYsCj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIGluZm8gPSB2Y2Rldi0+YWlycV9pbmZv
Owo+PiDCoMKgwqDCoMKgIHRoaW5pbnRfYXJlYS0+c3VtbWFyeV9pbmRpY2F0b3IgPQo+PiAtwqDC
oMKgwqDCoMKgwqAgKHVuc2lnbmVkIGxvbmcpICZpbmZvLT5zdW1tYXJ5X2luZGljYXRvcjsKPj4g
K8KgwqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25nKSBnZXRfc3VtbWFyeV9pbmRpY2F0b3IoaW5m
byk7Cj4+IMKgwqDCoMKgwqAgdGhpbmludF9hcmVhLT5pc2MgPSBWSVJUSU9fQUlSUV9JU0M7Cj4+
IMKgwqDCoMKgwqAgY2N3LT5jbWRfY29kZSA9IENDV19DTURfU0VUX0lORF9BREFQVEVSOwo+PiDC
oMKgwqDCoMKgIGNjdy0+ZmxhZ3MgPSBDQ1dfRkxBR19TTEk7Cj4+IEBAIC0xNTAwLDYgKzE1MDks
NyBAQCBzdGF0aWMgaW50IF9faW5pdCB2aXJ0aW9fY2N3X2luaXQodm9pZCkKPj4gwqAgewo+PiDC
oMKgwqDCoMKgIC8qIHBhcnNlIG5vX2F1dG8gc3RyaW5nIGJlZm9yZSB3ZSBkbyBhbnl0aGluZyBm
dXJ0aGVyICovCj4+IMKgwqDCoMKgwqAgbm9fYXV0b19wYXJzZSgpOwo+PiArwqDCoMKgIHN1bW1h
cnlfaW5kaWNhdG9ycyA9IGNpb19kbWFfemFsbG9jKE1BWF9BSVJRX0FSRUFTKTsKPj4gwqDCoMKg
wqDCoCByZXR1cm4gY2N3X2RyaXZlcl9yZWdpc3RlcigmdmlydGlvX2Njd19kcml2ZXIpOwo+PiDC
oCB9Cj4+IMKgIGRldmljZV9pbml0Y2FsbCh2aXJ0aW9fY2N3X2luaXQpOwo+Pgo+IAo+IAo+IAoK
LS0gCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4gLyBLaW5kIHJlZ2FyZHMKTWljaGFlbCBNw7xs
bGVyCgpJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9wbWVudCBHbWJIClZvcnNpdHpl
bmRlciBkZXMgQXVmc2ljaHRzcmF0czogTWF0dGhpYXMgSGFydG1hbm4KR2VzY2jDpGZ0c2bDvGhy
dW5nOiBEaXJrIFdpdHRrb3BwClNpdHogZGVyIEdlc2VsbHNjaGFmdDogQsO2YmxpbmdlbgpSZWdp
c3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2FydCwgSFJCIDI0MzI5NAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
