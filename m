Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D232273A
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:21:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 158C0CC4;
	Sun, 19 May 2019 16:17:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 25FA1D97
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 12:39:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 45806885
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 12:01:15 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x49BpmLN133121 for <virtualization@lists.linux-foundation.org>;
	Thu, 9 May 2019 08:01:14 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2schr9p4j8-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 09 May 2019 08:01:12 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Thu, 9 May 2019 13:01:08 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 May 2019 13:01:05 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x49C13rc25886830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 May 2019 12:01:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BAC542054;
	Thu,  9 May 2019 12:01:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 029C14203F;
	Thu,  9 May 2019 12:01:02 +0000 (GMT)
Received: from [9.145.47.201] (unknown [9.145.47.201])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2019 12:01:01 +0000 (GMT)
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
From: Pierre Morel <pmorel@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
Date: Thu, 9 May 2019 14:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050912-0016-0000-0000-00000279ECB4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050912-0017-0000-0000-000032D6A135
Message-Id: <a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905090073
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

T24gMDgvMDUvMjAxOSAxNjozMSwgUGllcnJlIE1vcmVsIHdyb3RlOgo+IE9uIDI2LzA0LzIwMTkg
MjA6MzIsIEhhbGlsIFBhc2ljIHdyb3RlOgo+PiBUaGlzIHdpbGwgY29tZSBpbiBoYW5keSBzb29u
IHdoZW4gd2UgcHVsbCBvdXQgdGhlIGluZGljYXRvcnMgZnJvbQo+PiB2aXJ0aW9fY2N3X2Rldmlj
ZSB0byBhIG1lbW9yeSBhcmVhIHRoYXQgaXMgc2hhcmVkIHdpdGggdGhlIGh5cGVydmlzb3IKPj4g
KGluIHBhcnRpY3VsYXIgZm9yIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbiBndWVzdHMpLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT4KPj4gLS0t
Cj4+IMKgIGRyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jIHwgNDAgCj4+ICsrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMgCj4+IGIvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0
aW9fY2N3LmMKPj4gaW5kZXggYmI3YTkyMzE2ZmM4Li4xZjNlN2Q1NjkyNGYgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+ICsrKyBiL2RyaXZlcnMvczM5
MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+IEBAIC02OCw2ICs2OCwxNiBAQCBzdHJ1Y3QgdmlydGlv
X2Njd19kZXZpY2Ugewo+PiDCoMKgwqDCoMKgIHZvaWQgKmFpcnFfaW5mbzsKPj4gwqAgfTsKPj4g
K3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqaW5kaWNhdG9ycyhzdHJ1Y3QgdmlydGlvX2Nj
d19kZXZpY2UgKnZjZGV2KQo+PiArewo+PiArwqDCoMKgIHJldHVybiAmdmNkZXYtPmluZGljYXRv
cnM7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqaW5kaWNhdG9y
czIoc3RydWN0IHZpcnRpb19jY3dfZGV2aWNlIAo+PiAqdmNkZXYpCj4+ICt7Cj4+ICvCoMKgwqAg
cmV0dXJuICZ2Y2Rldi0+aW5kaWNhdG9yczI7Cj4+ICt9Cj4+ICsKPj4gwqAgc3RydWN0IHZxX2lu
Zm9fYmxvY2tfbGVnYWN5IHsKPj4gwqDCoMKgwqDCoCBfX3U2NCBxdWV1ZTsKPj4gwqDCoMKgwqDC
oCBfX3UzMiBhbGlnbjsKPj4gQEAgLTMzNywxNyArMzQ3LDE3IEBAIHN0YXRpYyB2b2lkIHZpcnRp
b19jY3dfZHJvcF9pbmRpY2F0b3Ioc3RydWN0IAo+PiB2aXJ0aW9fY2N3X2RldmljZSAqdmNkZXYs
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjY3ctPmNkYSA9IChfX3UzMikodW5zaWduZWQgbG9uZykg
dGhpbmludF9hcmVhOwo+PiDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAvKiBwYXlsb2FkIGlzIHRoZSBhZGRyZXNzIG9mIHRoZSBpbmRpY2F0b3JzICovCj4+IC3CoMKg
wqDCoMKgwqDCoCBpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoJnZjZGV2LT5pbmRpY2F0b3Jz
KSwKPj4gK8KgwqDCoMKgwqDCoMKgIGluZGljYXRvcnAgPSBrbWFsbG9jKHNpemVvZihpbmRpY2F0
b3JzKHZjZGV2KSksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEdGUF9ETUEgfCBHRlBfS0VSTkVMKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaW5k
aWNhdG9ycCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgKmluZGljYXRvcnAgPSAwOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3LT5j
bWRfY29kZSA9IENDV19DTURfU0VUX0lORDsKPj4gLcKgwqDCoMKgwqDCoMKgIGNjdy0+Y291bnQg
PSBzaXplb2YoJnZjZGV2LT5pbmRpY2F0b3JzKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGNjdy0+Y291
bnQgPSBzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpOwo+IAo+IFRoaXMgbG9va3Mgc3RyYW5nZSB0
byBtZS4gV2FzIGFscmVhZHkgd2VpcmQgYmVmb3JlLgo+IEx1Y2t5IHdlIGFyZSBpbmRpY2F0b3Jz
IGFyZSBsb25nLi4uCj4gbWF5IGJlIGp1c3Qgc2l6ZW9mKGxvbmcpCgoKQUZBSUsgdGhlIHNpemUg
b2YgdGhlIGluZGljYXRvcnMgKEFJVi9BSVMpIGlzIG5vdCByZXN0cmljdGVkIGJ5IHRoZSAKYXJj
aGl0ZWN0dXJlLgpIb3dldmVyIHdlIG5ldmVyIHVzZSBtb3JlIHRoYW4gNjQgYml0cywgZG8gd2Ug
ZXZlciBoYXZlIGFuIGFkYXB0ZXIgCmhhdmluZyBtb3JlIHRoYW4gNjQgZGlmZmVyZW50IGludGVy
cnVwdHM/CgpNYXkgYmUgd2UgY2FuIHN0YXRlIHRoYW4gd2UgdXNlIGEgbWF4aW1hbCBudW1iZXIg
b2YgQUlTQiBvZiA2NCBhbmQgCnRoZXJlZm9yIHVzZSBpbmRpY2F0b3JzIHdpdGggYSBzaXplIG9m
IHVuc2lnbmVkIGxvbmcsIG9yIF9fdTY0IG9yIAp3aGF0ZXZlciBpcyBhcHByb3ByaWF0ZS4gUGxl
YXNlIGNsZWFyIHRoaXMuCgpXaXRoIHRoaXMgY2xlYXJlZDoKUmV2aWV3ZWQtYnk6IFBpZXJyZSBN
b3JlbDxwbW9yZWxAbGludXguaWJtLmNvbT4KCgpSZWdhcmRzLApQaWVycmUKCgotLSAKUGllcnJl
IE1vcmVsCkxpbnV4L0tWTS9RRU1VIGluIELDtmJsaW5nZW4gLSBHZXJtYW55CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
