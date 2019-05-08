Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BB22735
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:20:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F144CB8;
	Sun, 19 May 2019 16:17:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 282FCDAB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 14:31:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A33E3884
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 14:31:46 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x48EUZPQ036488 for <virtualization@lists.linux-foundation.org>;
	Wed, 8 May 2019 10:31:46 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sbyumbuvh-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 08 May 2019 10:31:44 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Wed, 8 May 2019 15:31:42 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 8 May 2019 15:31:38 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x48EVbFn45547764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 8 May 2019 14:31:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20DA14204C;
	Wed,  8 May 2019 14:31:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F1D942042;
	Wed,  8 May 2019 14:31:36 +0000 (GMT)
Received: from [9.145.42.10] (unknown [9.145.42.10])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  8 May 2019 14:31:36 +0000 (GMT)
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Date: Wed, 8 May 2019 16:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426183245.37939-9-pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050814-0016-0000-0000-0000027998FA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050814-0017-0000-0000-000032D6491B
Message-Id: <716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905080090
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

T24gMjYvMDQvMjAxOSAyMDozMiwgSGFsaWwgUGFzaWMgd3JvdGU6Cj4gVGhpcyB3aWxsIGNvbWUg
aW4gaGFuZHkgc29vbiB3aGVuIHdlIHB1bGwgb3V0IHRoZSBpbmRpY2F0b3JzIGZyb20KPiB2aXJ0
aW9fY2N3X2RldmljZSB0byBhIG1lbW9yeSBhcmVhIHRoYXQgaXMgc2hhcmVkIHdpdGggdGhlIGh5
cGVydmlzb3IKPiAoaW4gcGFydGljdWxhciBmb3IgcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uIGd1
ZXN0cykuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFsaWwgUGFzaWMgPHBhc2ljQGxpbnV4LmlibS5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYyB8IDQwICsrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19j
Y3cuYwo+IGluZGV4IGJiN2E5MjMxNmZjOC4uMWYzZTdkNTY5MjRmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4gKysrIGIvZHJpdmVycy9zMzkwL3ZpcnRp
by92aXJ0aW9fY2N3LmMKPiBAQCAtNjgsNiArNjgsMTYgQEAgc3RydWN0IHZpcnRpb19jY3dfZGV2
aWNlIHsKPiAgIAl2b2lkICphaXJxX2luZm87Cj4gICB9Owo+ICAgCj4gK3N0YXRpYyBpbmxpbmUg
dW5zaWduZWQgbG9uZyAqaW5kaWNhdG9ycyhzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2
KQo+ICt7Cj4gKwlyZXR1cm4gJnZjZGV2LT5pbmRpY2F0b3JzOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW5saW5lIHVuc2lnbmVkIGxvbmcgKmluZGljYXRvcnMyKHN0cnVjdCB2aXJ0aW9fY2N3X2Rldmlj
ZSAqdmNkZXYpCj4gK3sKPiArCXJldHVybiAmdmNkZXYtPmluZGljYXRvcnMyOwo+ICt9Cj4gKwo+
ICAgc3RydWN0IHZxX2luZm9fYmxvY2tfbGVnYWN5IHsKPiAgIAlfX3U2NCBxdWV1ZTsKPiAgIAlf
X3UzMiBhbGlnbjsKPiBAQCAtMzM3LDE3ICszNDcsMTcgQEAgc3RhdGljIHZvaWQgdmlydGlvX2Nj
d19kcm9wX2luZGljYXRvcihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2LAo+ICAgCQlj
Y3ctPmNkYSA9IChfX3UzMikodW5zaWduZWQgbG9uZykgdGhpbmludF9hcmVhOwo+ICAgCX0gZWxz
ZSB7Cj4gICAJCS8qIHBheWxvYWQgaXMgdGhlIGFkZHJlc3Mgb2YgdGhlIGluZGljYXRvcnMgKi8K
PiAtCQlpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoJnZjZGV2LT5pbmRpY2F0b3JzKSwKPiAr
CQlpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpLAo+ICAgCQkJ
CSAgICAgR0ZQX0RNQSB8IEdGUF9LRVJORUwpOwo+ICAgCQlpZiAoIWluZGljYXRvcnApCj4gICAJ
CQlyZXR1cm47Cj4gICAJCSppbmRpY2F0b3JwID0gMDsKPiAgIAkJY2N3LT5jbWRfY29kZSA9IEND
V19DTURfU0VUX0lORDsKPiAtCQljY3ctPmNvdW50ID0gc2l6ZW9mKCZ2Y2Rldi0+aW5kaWNhdG9y
cyk7Cj4gKwkJY2N3LT5jb3VudCA9IHNpemVvZihpbmRpY2F0b3JzKHZjZGV2KSk7CgpUaGlzIGxv
b2tzIHN0cmFuZ2UgdG8gbWUuIFdhcyBhbHJlYWR5IHdlaXJkIGJlZm9yZS4KTHVja3kgd2UgYXJl
IGluZGljYXRvcnMgYXJlIGxvbmcuLi4KbWF5IGJlIGp1c3Qgc2l6ZW9mKGxvbmcpCgo+ICAgCQlj
Y3ctPmNkYSA9IChfX3UzMikodW5zaWduZWQgbG9uZykgaW5kaWNhdG9ycDsKPiAgIAl9Cj4gICAJ
LyogRGVyZWdpc3RlciBpbmRpY2F0b3JzIGZyb20gaG9zdC4gKi8KPiAtCXZjZGV2LT5pbmRpY2F0
b3JzID0gMDsKPiArCSppbmRpY2F0b3JzKHZjZGV2KSA9IDA7Cj4gICAJY2N3LT5mbGFncyA9IDA7
Cj4gICAJcmV0ID0gY2N3X2lvX2hlbHBlcih2Y2RldiwgY2N3LAo+ICAgCQkJICAgIHZjZGV2LT5p
c190aGluaW50ID8KPiBAQCAtNjU2LDEwICs2NjYsMTAgQEAgc3RhdGljIGludCB2aXJ0aW9fY2N3
X2ZpbmRfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+ICAg
CSAqIFdlIG5lZWQgYSBkYXRhIGFyZWEgdW5kZXIgMkcgdG8gY29tbXVuaWNhdGUuIE91ciBwYXls
b2FkIGlzCj4gICAJICogdGhlIGFkZHJlc3Mgb2YgdGhlIGluZGljYXRvcnMuCj4gICAJKi8KPiAt
CWluZGljYXRvcnAgPSBrbWFsbG9jKHNpemVvZigmdmNkZXYtPmluZGljYXRvcnMpLCBHRlBfRE1B
IHwgR0ZQX0tFUk5FTCk7Cj4gKwlpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoaW5kaWNhdG9y
cyh2Y2RldikpLCBHRlBfRE1BIHwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFpbmRpY2F0b3JwKQo+
ICAgCQlnb3RvIG91dDsKPiAtCSppbmRpY2F0b3JwID0gKHVuc2lnbmVkIGxvbmcpICZ2Y2Rldi0+
aW5kaWNhdG9yczsKPiArCSppbmRpY2F0b3JwID0gKHVuc2lnbmVkIGxvbmcpIGluZGljYXRvcnMo
dmNkZXYpOwo+ICAgCWlmICh2Y2Rldi0+aXNfdGhpbmludCkgewo+ICAgCQlyZXQgPSB2aXJ0aW9f
Y2N3X3JlZ2lzdGVyX2FkYXB0ZXJfaW5kKHZjZGV2LCB2cXMsIG52cXMsIGNjdyk7Cj4gICAJCWlm
IChyZXQpCj4gQEAgLTY2OCwyMSArNjc4LDIxIEBAIHN0YXRpYyBpbnQgdmlydGlvX2Njd19maW5k
X3ZxcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgbnZxcywKPiAgIAl9Cj4g
ICAJaWYgKCF2Y2Rldi0+aXNfdGhpbmludCkgewo+ICAgCQkvKiBSZWdpc3RlciBxdWV1ZSBpbmRp
Y2F0b3JzIHdpdGggaG9zdC4gKi8KPiAtCQl2Y2Rldi0+aW5kaWNhdG9ycyA9IDA7Cj4gKwkJKmlu
ZGljYXRvcnModmNkZXYpID0gMDsKPiAgIAkJY2N3LT5jbWRfY29kZSA9IENDV19DTURfU0VUX0lO
RDsKPiAgIAkJY2N3LT5mbGFncyA9IDA7Cj4gLQkJY2N3LT5jb3VudCA9IHNpemVvZigmdmNkZXYt
PmluZGljYXRvcnMpOwo+ICsJCWNjdy0+Y291bnQgPSBzaXplb2YoaW5kaWNhdG9ycyh2Y2Rldikp
OwoKc2FtZSBhcyBiZWZvcmUKCj4gICAJCWNjdy0+Y2RhID0gKF9fdTMyKSh1bnNpZ25lZCBsb25n
KSBpbmRpY2F0b3JwOwo+ICAgCQlyZXQgPSBjY3dfaW9faGVscGVyKHZjZGV2LCBjY3csIFZJUlRJ
T19DQ1dfRE9JTkdfU0VUX0lORCk7Cj4gICAJCWlmIChyZXQpCj4gICAJCQlnb3RvIG91dDsKPiAg
IAl9Cj4gICAJLyogUmVnaXN0ZXIgaW5kaWNhdG9yczIgd2l0aCBob3N0IGZvciBjb25maWcgY2hh
bmdlcyAqLwo+IC0JKmluZGljYXRvcnAgPSAodW5zaWduZWQgbG9uZykgJnZjZGV2LT5pbmRpY2F0
b3JzMjsKPiAtCXZjZGV2LT5pbmRpY2F0b3JzMiA9IDA7Cj4gKwkqaW5kaWNhdG9ycCA9ICh1bnNp
Z25lZCBsb25nKSBpbmRpY2F0b3JzMih2Y2Rldik7Cj4gKwkqaW5kaWNhdG9yczIodmNkZXYpID0g
MDsKPiAgIAljY3ctPmNtZF9jb2RlID0gQ0NXX0NNRF9TRVRfQ09ORl9JTkQ7Cj4gICAJY2N3LT5m
bGFncyA9IDA7Cj4gLQljY3ctPmNvdW50ID0gc2l6ZW9mKCZ2Y2Rldi0+aW5kaWNhdG9yczIpOwo+
ICsJY2N3LT5jb3VudCA9IHNpemVvZihpbmRpY2F0b3JzMih2Y2RldikpOwoKaGVyZSB0b28KCj4g
ICAJY2N3LT5jZGEgPSAoX191MzIpKHVuc2lnbmVkIGxvbmcpIGluZGljYXRvcnA7Cj4gICAJcmV0
ID0gY2N3X2lvX2hlbHBlcih2Y2RldiwgY2N3LCBWSVJUSU9fQ0NXX0RPSU5HX1NFVF9DT05GX0lO
RCk7Cj4gICAJaWYgKHJldCkKPiBAQCAtMTA5MiwxNyArMTEwMiwxNyBAQCBzdGF0aWMgdm9pZCB2
aXJ0aW9fY2N3X2ludF9oYW5kbGVyKHN0cnVjdCBjY3dfZGV2aWNlICpjZGV2LAo+ICAgCQkJdmNk
ZXYtPmVyciA9IC1FSU87Cj4gICAJfQo+ICAgCXZpcnRpb19jY3dfY2hlY2tfYWN0aXZpdHkodmNk
ZXYsIGFjdGl2aXR5KTsKPiAtCWZvcl9lYWNoX3NldF9iaXQoaSwgJnZjZGV2LT5pbmRpY2F0b3Jz
LAo+IC0JCQkgc2l6ZW9mKHZjZGV2LT5pbmRpY2F0b3JzKSAqIEJJVFNfUEVSX0JZVEUpIHsKPiAr
CWZvcl9lYWNoX3NldF9iaXQoaSwgaW5kaWNhdG9ycyh2Y2RldiksCj4gKwkJCSBzaXplb2YoKmlu
ZGljYXRvcnModmNkZXYpKSAqIEJJVFNfUEVSX0JZVEUpIHsKPiAgIAkJLyogVGhlIGJpdCBjbGVh
ciBtdXN0IGhhcHBlbiBiZWZvcmUgdGhlIHZyaW5nIGtpY2suICovCj4gLQkJY2xlYXJfYml0KGks
ICZ2Y2Rldi0+aW5kaWNhdG9ycyk7Cj4gKwkJY2xlYXJfYml0KGksIGluZGljYXRvcnModmNkZXYp
KTsKPiAgIAkJYmFycmllcigpOwo+ICAgCQl2cSA9IHZpcnRpb19jY3dfdnFfYnlfaW5kKHZjZGV2
LCBpKTsKPiAgIAkJdnJpbmdfaW50ZXJydXB0KDAsIHZxKTsKPiAgIAl9Cj4gLQlpZiAodGVzdF9i
aXQoMCwgJnZjZGV2LT5pbmRpY2F0b3JzMikpIHsKPiArCWlmICh0ZXN0X2JpdCgwLCBpbmRpY2F0
b3JzMih2Y2RldikpKSB7Cj4gICAJCXZpcnRpb19jb25maWdfY2hhbmdlZCgmdmNkZXYtPnZkZXYp
Owo+IC0JCWNsZWFyX2JpdCgwLCAmdmNkZXYtPmluZGljYXRvcnMyKTsKPiArCQljbGVhcl9iaXQo
MCwgaW5kaWNhdG9yczIodmNkZXYpKTsKPiAgIAl9Cj4gICB9Cj4gICAKPiAKCkhlcmUgYWdhaW4g
anVzdCBhIGZhc3QgY2hlY2suCkkgd2lsbCBnbyBpbiB0aGUgZnVuY3Rpb25hbCBsYXRlci4KClJl
Z2FyZHMsClBpZXJyZQoKCi0tIApQaWVycmUgTW9yZWwKTGludXgvS1ZNL1FFTVUgaW4gQsO2Ymxp
bmdlbiAtIEdlcm1hbnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
