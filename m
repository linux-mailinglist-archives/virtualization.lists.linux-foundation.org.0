Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36722737
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:20:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2EEECBB;
	Sun, 19 May 2019 16:17:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0D5322329
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 14:46:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EF242881
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 14:46:20 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x48EbT6L039579 for <virtualization@lists.linux-foundation.org>;
	Wed, 8 May 2019 10:46:20 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sbyb7xq3q-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 08 May 2019 10:46:19 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Wed, 8 May 2019 15:46:17 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 8 May 2019 15:46:14 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x48EkDeY61341860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 8 May 2019 14:46:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00ACC42041;
	Wed,  8 May 2019 14:46:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D32042047;
	Wed,  8 May 2019 14:46:12 +0000 (GMT)
Received: from [9.145.42.10] (unknown [9.145.42.10])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  8 May 2019 14:46:12 +0000 (GMT)
Subject: Re: [PATCH 09/10] virtio/s390: use DMA memory for ccw I/O and classic
	notifiers
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-10-pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Date: Wed, 8 May 2019 16:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426183245.37939-10-pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050814-0020-0000-0000-0000033A9497
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050814-0021-0000-0000-0000218D3642
Message-Id: <a873909a-9846-d6d3-f03e-e86d53fd9c75@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905080092
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
Reply-To: pmorel@linux.ibm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMjYvMDQvMjAxOSAyMDozMiwgSGFsaWwgUGFzaWMgd3JvdGU6Cj4gQmVmb3JlIHZpcnRpby1j
Y3cgY291bGQgZ2V0IGF3YXkgd2l0aCBub3QgdXNpbmcgRE1BIEFQSSBmb3IgdGhlIHBpZWNlcyBv
Zgo+IG1lbW9yeSBpdCBkb2VzIGNjdyBJL08gd2l0aC4gV2l0aCBwcm90ZWN0ZWQgdmlydHVhbGl6
YXRpb24gdGhpcyBoYXMgdG8KPiBjaGFuZ2UsIHNpbmNlIHRoZSBoeXBlcnZpc29yIG5lZWRzIHRv
IHJlYWQgYW5kIHNvbWV0aW1lcyBhbHNvIHdyaXRlIHRoZXNlCj4gcGllY2VzIG9mIG1lbW9yeS4K
PiAKPiBUaGUgaHlwZXJ2aXNvciBpcyBzdXBwb3NlZCB0byBwb2tlIHRoZSBjbGFzc2ljIG5vdGlm
aWVycywgaWYgdGhlc2UgYXJlCj4gdXNlZCwgb3V0IG9mIGJhbmQgd2l0aCByZWdhcmRzIHRvIGNj
dyBJL08uIFNvIHRoZXNlIG5lZWQgdG8gYmUgYWxsb2NhdGVkCj4gYXMgRE1BIG1lbW9yeSAod2hp
Y2ggaXMgc2hhcmVkIG1lbW9yeSBmb3IgcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uCj4gZ3Vlc3Rz
KS4KPiAKPiBMZXQgdXMgZmFjdG9yIG91dCBldmVyeXRoaW5nIGZyb20gc3RydWN0IHZpcnRpb19j
Y3dfZGV2aWNlIHRoYXQgbmVlZHMgdG8KPiBiZSBETUEgbWVtb3J5IGluIGEgc2F0ZWxsaXRlIHRo
YXQgaXMgYWxsb2NhdGVkIGFzIHN1Y2guCj4gCj4gTm90ZTogVGhlIGNvbnRyb2wgYmxvY2tzIG9m
IEkvTyBpbnN0cnVjdGlvbnMgZG8gbm90IG5lZWQgdG8gYmUgc2hhcmVkLgo+IFRoZXNlIGFyZSBt
YXJzaGFsbGVkIGJ5IHRoZSB1bHRyYXZpc29yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbGlsIFBh
c2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9zMzkwL3ZpcnRpby92
aXJ0aW9fY2N3LmMgfCAxNzcgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jIGIvZHJpdmVy
cy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiBpbmRleCAxZjNlN2Q1NjkyNGYuLjYxM2IxODAw
MWEwYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+ICsr
KyBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4gQEAgLTQ2LDkgKzQ2LDE1IEBA
IHN0cnVjdCB2cV9jb25maWdfYmxvY2sgewo+ICAgI2RlZmluZSBWSVJUSU9fQ0NXX0NPTkZJR19T
SVpFIDB4MTAwCj4gICAvKiBzYW1lIGFzIFBDSSBjb25maWcgc3BhY2Ugc2l6ZSwgc2hvdWxkIGJl
IGVub3VnaCBmb3IgYWxsIGRyaXZlcnMgKi8KPiAgIAo+ICtzdHJ1Y3QgdmNkZXZfZG1hX2FyZWEg
ewo+ICsJdW5zaWduZWQgbG9uZyBpbmRpY2F0b3JzOwo+ICsJdW5zaWduZWQgbG9uZyBpbmRpY2F0
b3JzMjsKPiArCXN0cnVjdCB2cV9jb25maWdfYmxvY2sgY29uZmlnX2Jsb2NrOwo+ICsJX191OCBz
dGF0dXM7Cj4gK307Cj4gKwo+ICAgc3RydWN0IHZpcnRpb19jY3dfZGV2aWNlIHsKPiAgIAlzdHJ1
Y3QgdmlydGlvX2RldmljZSB2ZGV2Owo+IC0JX191OCAqc3RhdHVzOwo+ICAgCV9fdTggY29uZmln
W1ZJUlRJT19DQ1dfQ09ORklHX1NJWkVdOwo+ICAgCXN0cnVjdCBjY3dfZGV2aWNlICpjZGV2Owo+
ICAgCV9fdTMyIGN1cnJfaW87Cj4gQEAgLTU4LDI0ICs2NCwyMiBAQCBzdHJ1Y3QgdmlydGlvX2Nj
d19kZXZpY2Ugewo+ICAgCXNwaW5sb2NrX3QgbG9jazsKPiAgIAlzdHJ1Y3QgbXV0ZXggaW9fbG9j
azsgLyogU2VyaWFsaXplcyBJL08gcmVxdWVzdHMgKi8KPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIHZp
cnRxdWV1ZXM7Cj4gLQl1bnNpZ25lZCBsb25nIGluZGljYXRvcnM7Cj4gLQl1bnNpZ25lZCBsb25n
IGluZGljYXRvcnMyOwo+IC0Jc3RydWN0IHZxX2NvbmZpZ19ibG9jayAqY29uZmlnX2Jsb2NrOwo+
ICAgCWJvb2wgaXNfdGhpbmludDsKPiAgIAlib29sIGdvaW5nX2F3YXk7Cj4gICAJYm9vbCBkZXZp
Y2VfbG9zdDsKPiAgIAl1bnNpZ25lZCBpbnQgY29uZmlnX3JlYWR5Owo+ICAgCXZvaWQgKmFpcnFf
aW5mbzsKPiArCXN0cnVjdCB2Y2Rldl9kbWFfYXJlYSAqZG1hX2FyZWE7Cj4gICB9Owo+ICAgCj4g
ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgKmluZGljYXRvcnMoc3RydWN0IHZpcnRpb19j
Y3dfZGV2aWNlICp2Y2RldikKPiAgIHsKPiAtCXJldHVybiAmdmNkZXYtPmluZGljYXRvcnM7Cj4g
KwlyZXR1cm4gJnZjZGV2LT5kbWFfYXJlYS0+aW5kaWNhdG9yczsKPiAgIH0KPiAgIAo+ICAgc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBsb25nICppbmRpY2F0b3JzMihzdHJ1Y3QgdmlydGlvX2Njd19k
ZXZpY2UgKnZjZGV2KQo+ICAgewo+IC0JcmV0dXJuICZ2Y2Rldi0+aW5kaWNhdG9yczI7Cj4gKwly
ZXR1cm4gJnZjZGV2LT5kbWFfYXJlYS0+aW5kaWNhdG9yczI7Cj4gICB9Cj4gICAKPiAgIHN0cnVj
dCB2cV9pbmZvX2Jsb2NrX2xlZ2FjeSB7Cj4gQEAgLTE3Niw2ICsxODAsMjIgQEAgc3RhdGljIHN0
cnVjdCB2aXJ0aW9fY2N3X2RldmljZSAqdG9fdmNfZGV2aWNlKHN0cnVjdCB2aXJ0aW9fZGV2aWNl
ICp2ZGV2KQo+ICAgCXJldHVybiBjb250YWluZXJfb2YodmRldiwgc3RydWN0IHZpcnRpb19jY3df
ZGV2aWNlLCB2ZGV2KTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgKl9fdmNfZG1h
X2FsbG9jKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCBzaXplX3Qgc2l6ZSkKPiArewo+ICsJ
cmV0dXJuIGNjd19kZXZpY2VfZG1hX3phbGxvYyh0b192Y19kZXZpY2UodmRldiktPmNkZXYsIHNp
emUpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX192Y19kbWFfZnJlZShzdHJ1Y3Qg
dmlydGlvX2RldmljZSAqdmRldiwgc2l6ZV90IHNpemUsCj4gKwkJCQkgdm9pZCAqY3B1X2FkZHIp
Cj4gK3sKPiArCXJldHVybiBjY3dfZGV2aWNlX2RtYV9mcmVlKHRvX3ZjX2RldmljZSh2ZGV2KS0+
Y2RldiwgY3B1X2FkZHIsIHNpemUpOwo+ICt9Cj4gKwo+ICsjZGVmaW5lIHZjX2RtYV9hbGxvY19z
dHJ1Y3QodmRldiwgcHRyKSBcCj4gKwkoe3B0ciA9IF9fdmNfZG1hX2FsbG9jKHZkZXYsIHNpemVv
ZigqKHB0cikpKTsgfSkKPiArI2RlZmluZSB2Y19kbWFfZnJlZV9zdHJ1Y3QodmRldiwgcHRyKSBc
Cj4gKwlfX3ZjX2RtYV9mcmVlKHZkZXYsIHNpemVvZigqKHB0cikpLCAocHRyKSkKPiArCj4gICBz
dGF0aWMgdm9pZCBkcm9wX2FpcnFfaW5kaWNhdG9yKHN0cnVjdCB2aXJ0cXVldWUgKnZxLCBzdHJ1
Y3QgYWlycV9pbmZvICppbmZvKQo+ICAgewo+ICAgCXVuc2lnbmVkIGxvbmcgaSwgZmxhZ3M7Cj4g
QEAgLTMzNSw4ICszNTUsNyBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fY2N3X2Ryb3BfaW5kaWNhdG9y
KHN0cnVjdCB2aXJ0aW9fY2N3X2RldmljZSAqdmNkZXYsCj4gICAJc3RydWN0IGFpcnFfaW5mbyAq
YWlycV9pbmZvID0gdmNkZXYtPmFpcnFfaW5mbzsKPiAgIAo+ICAgCWlmICh2Y2Rldi0+aXNfdGhp
bmludCkgewo+IC0JCXRoaW5pbnRfYXJlYSA9IGt6YWxsb2Moc2l6ZW9mKCp0aGluaW50X2FyZWEp
LAo+IC0JCQkJICAgICAgIEdGUF9ETUEgfCBHRlBfS0VSTkVMKTsKPiArCQl2Y19kbWFfYWxsb2Nf
c3RydWN0KCZ2Y2Rldi0+dmRldiwgdGhpbmludF9hcmVhKTsKPiAgIAkJaWYgKCF0aGluaW50X2Fy
ZWEpCj4gICAJCQlyZXR1cm47Cj4gICAJCXRoaW5pbnRfYXJlYS0+c3VtbWFyeV9pbmRpY2F0b3Ig
PQo+IEBAIC0zNDcsOCArMzY2LDggQEAgc3RhdGljIHZvaWQgdmlydGlvX2Njd19kcm9wX2luZGlj
YXRvcihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2LAo+ICAgCQljY3ctPmNkYSA9IChf
X3UzMikodW5zaWduZWQgbG9uZykgdGhpbmludF9hcmVhOwo+ICAgCX0gZWxzZSB7Cj4gICAJCS8q
IHBheWxvYWQgaXMgdGhlIGFkZHJlc3Mgb2YgdGhlIGluZGljYXRvcnMgKi8KPiAtCQlpbmRpY2F0
b3JwID0ga21hbGxvYyhzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpLAo+IC0JCQkJICAgICBHRlBf
RE1BIHwgR0ZQX0tFUk5FTCk7Cj4gKwkJaW5kaWNhdG9ycCA9IF9fdmNfZG1hX2FsbG9jKCZ2Y2Rl
di0+dmRldiwKPiArCQkJCQkgICBzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpKTsKCnNob3VsZCBi
ZSBzaXplb2YobG9uZykgPwoKVGhpcyBpcyBhIHJlY3VycmVudCBlcnJvciwgYnV0IGl0IGlzIG5v
dCBhbiBpc3N1ZSBiZWNhdXNlIHRoZSBzaXplIG9mCnRoZSBpbmRpY2F0b3JzIGlzIHVuc2lnbmVk
IGxvbmcgYXMgdGhlIHNpemUgb2YgdGhlIHBvaW50ZXIuCgpSZWdhcmRzLApQaWVycmUKCi0tIApQ
aWVycmUgTW9yZWwKTGludXgvS1ZNL1FFTVUgaW4gQsO2YmxpbmdlbiAtIEdlcm1hbnkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
