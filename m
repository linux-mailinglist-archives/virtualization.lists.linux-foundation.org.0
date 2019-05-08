Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B452322738
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:20:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 503C0CBF;
	Sun, 19 May 2019 16:17:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ACD182508
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 15:11:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 218D0196
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 15:11:23 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x48F7fse065905 for <virtualization@lists.linux-foundation.org>;
	Wed, 8 May 2019 11:11:23 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sc1bd0pvm-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 08 May 2019 11:11:22 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Wed, 8 May 2019 16:11:20 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 8 May 2019 16:11:17 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x48FBFWJ48037982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 8 May 2019 15:11:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 239CD42049;
	Wed,  8 May 2019 15:11:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D2C142041;
	Wed,  8 May 2019 15:11:14 +0000 (GMT)
Received: from [9.145.42.10] (unknown [9.145.42.10])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  8 May 2019 15:11:14 +0000 (GMT)
Subject: Re: [PATCH 10/10] virtio/s390: make airq summary indicators DMA
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-11-pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Date: Wed, 8 May 2019 17:11:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426183245.37939-11-pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050815-0008-0000-0000-000002E493AF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050815-0009-0000-0000-0000225115A0
Message-Id: <74ff9a63-891a-7e24-0865-8cc91a95cada@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905080095
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

T24gMjYvMDQvMjAxOSAyMDozMiwgSGFsaWwgUGFzaWMgd3JvdGU6Cj4gSHlwZXJ2aXNvciBuZWVk
cyB0byBpbnRlcmFjdCB3aXRoIHRoZSBzdW1tYXJ5IGluZGljYXRvcnMsIHNvIHRoZXNlCj4gbmVl
ZCB0byBiZSBETUEgbWVtb3J5IGFzIHdlbGwgKGF0IGxlYXN0IGZvciBwcm90ZWN0ZWQgdmlydHVh
bGl6YXRpb24KPiBndWVzdHMpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbGlsIFBhc2ljIDxwYXNp
Y0BsaW51eC5pYm0uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3
LmMgfCAyNCArKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Mz
OTAvdmlydGlvL3ZpcnRpb19jY3cuYyBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5j
Cj4gaW5kZXggNjEzYjE4MDAxYTBjLi42MDU4YjA3ZmVhMDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3Zp
cnRpb19jY3cuYwo+IEBAIC0xNDAsMTEgKzE0MCwxNyBAQCBzdGF0aWMgaW50IHZpcnRpb19jY3df
dXNlX2FpcnEgPSAxOwo+ICAgCj4gICBzdHJ1Y3QgYWlycV9pbmZvIHsKPiAgIAlyd2xvY2tfdCBs
b2NrOwo+IC0JdTggc3VtbWFyeV9pbmRpY2F0b3I7Cj4gKwl1OCBzdW1tYXJ5X2luZGljYXRvcl9p
ZHg7Cj4gICAJc3RydWN0IGFpcnFfc3RydWN0IGFpcnE7Cj4gICAJc3RydWN0IGFpcnFfaXYgKmFp
djsKPiAgIH07Cj4gICBzdGF0aWMgc3RydWN0IGFpcnFfaW5mbyAqYWlycV9hcmVhc1tNQVhfQUlS
UV9BUkVBU107Cj4gK3N0YXRpYyB1OCAqc3VtbWFyeV9pbmRpY2F0b3JzOwo+ICsKPiArc3RhdGlj
IGlubGluZSB1OCAqZ2V0X3N1bW1hcnlfaW5kaWNhdG9yKHN0cnVjdCBhaXJxX2luZm8gKmluZm8p
Cj4gK3sKPiArCXJldHVybiBzdW1tYXJ5X2luZGljYXRvcnMgKyBpbmZvLT5zdW1tYXJ5X2luZGlj
YXRvcl9pZHg7Cj4gK30KPiAgIAo+ICAgI2RlZmluZSBDQ1dfQ01EX1NFVF9WUSAweDEzCj4gICAj
ZGVmaW5lIENDV19DTURfVkRFVl9SRVNFVCAweDMzCj4gQEAgLTIyNSw3ICsyMzEsNyBAQCBzdGF0
aWMgdm9pZCB2aXJ0aW9fYWlycV9oYW5kbGVyKHN0cnVjdCBhaXJxX3N0cnVjdCAqYWlycSkKPiAg
IAkJCWJyZWFrOwo+ICAgCQl2cmluZ19pbnRlcnJ1cHQoMCwgKHZvaWQgKilhaXJxX2l2X2dldF9w
dHIoaW5mby0+YWl2LCBhaSkpOwo+ICAgCX0KPiAtCWluZm8tPnN1bW1hcnlfaW5kaWNhdG9yID0g
MDsKPiArCSooZ2V0X3N1bW1hcnlfaW5kaWNhdG9yKGluZm8pKSA9IDA7Cj4gICAJc21wX3dtYigp
Owo+ICAgCS8qIFdhbGsgdGhyb3VnaCBpbmRpY2F0b3JzIGZpZWxkLCBzdW1tYXJ5IGluZGljYXRv
ciBub3QgYWN0aXZlLiAqLwo+ICAgCWZvciAoYWkgPSAwOzspIHsKPiBAQCAtMjM3LDcgKzI0Myw4
IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19haXJxX2hhbmRsZXIoc3RydWN0IGFpcnFfc3RydWN0ICph
aXJxKQo+ICAgCXJlYWRfdW5sb2NrKCZpbmZvLT5sb2NrKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMg
c3RydWN0IGFpcnFfaW5mbyAqbmV3X2FpcnFfaW5mbyh2b2lkKQo+ICsvKiBjYWxsIHdpdGggYWly
cV9hcmVhc19sb2NrIGhlbGQgKi8KPiArc3RhdGljIHN0cnVjdCBhaXJxX2luZm8gKm5ld19haXJx
X2luZm8oaW50IGluZGV4KQo+ICAgewo+ICAgCXN0cnVjdCBhaXJxX2luZm8gKmluZm87Cj4gICAJ
aW50IHJjOwo+IEBAIC0yNTIsNyArMjU5LDggQEAgc3RhdGljIHN0cnVjdCBhaXJxX2luZm8gKm5l
d19haXJxX2luZm8odm9pZCkKPiAgIAkJcmV0dXJuIE5VTEw7Cj4gICAJfQo+ICAgCWluZm8tPmFp
cnEuaGFuZGxlciA9IHZpcnRpb19haXJxX2hhbmRsZXI7Cj4gLQlpbmZvLT5haXJxLmxzaV9wdHIg
PSAmaW5mby0+c3VtbWFyeV9pbmRpY2F0b3I7Cj4gKwlpbmZvLT5zdW1tYXJ5X2luZGljYXRvcl9p
ZHggPSBpbmRleDsKPiArCWluZm8tPmFpcnEubHNpX3B0ciA9IGdldF9zdW1tYXJ5X2luZGljYXRv
cihpbmZvKTsKPiAgIAlpbmZvLT5haXJxLmxzaV9tYXNrID0gMHhmZjsKPiAgIAlpbmZvLT5haXJx
LmlzYyA9IFZJUlRJT19BSVJRX0lTQzsKPiAgIAlyYyA9IHJlZ2lzdGVyX2FkYXB0ZXJfaW50ZXJy
dXB0KCZpbmZvLT5haXJxKTsKPiBAQCAtMjczLDggKzI4MSw5IEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIGdldF9haXJxX2luZGljYXRvcihzdHJ1Y3QgdmlydHF1ZXVlICp2cXNbXSwgaW50IG52cXMs
Cj4gICAJdW5zaWduZWQgbG9uZyBiaXQsIGZsYWdzOwo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8
IE1BWF9BSVJRX0FSRUFTICYmICFpbmRpY2F0b3JfYWRkcjsgaSsrKSB7Cj4gKwkJLyogVE9ETzog
dGhpcyBzZWVtcyB0byBiZSByYWN5ICovCgp5ZXMsIG15IG9waW5pb25zIHRvbywgd2FzIGFscmVh
ZHkgcmFjeSwgaW4gbXkgb3Bpbmlvbiwgd2UgbmVlZCBhbm90aGVyIApwYXRjaCBpbiBhbm90aGVy
IHNlcmllcyB0byBmaXggdGhpcy4KCkhvd2V2ZXIsIG5vdCBzdXJlIGFib3V0IHRoZSBjb21tZW50
LgoKPiAgIAkJaWYgKCFhaXJxX2FyZWFzW2ldKQo+IC0JCQlhaXJxX2FyZWFzW2ldID0gbmV3X2Fp
cnFfaW5mbygpOwo+ICsJCQlhaXJxX2FyZWFzW2ldID0gbmV3X2FpcnFfaW5mbyhpKTsKPiAgIAkJ
aW5mbyA9IGFpcnFfYXJlYXNbaV07Cj4gICAJCWlmICghaW5mbykKPiAgIAkJCXJldHVybiAwOwo+
IEBAIC0zNTksNyArMzY4LDcgQEAgc3RhdGljIHZvaWQgdmlydGlvX2Njd19kcm9wX2luZGljYXRv
cihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2LAo+ICAgCQlpZiAoIXRoaW5pbnRfYXJl
YSkKPiAgIAkJCXJldHVybjsKPiAgIAkJdGhpbmludF9hcmVhLT5zdW1tYXJ5X2luZGljYXRvciA9
Cj4gLQkJCSh1bnNpZ25lZCBsb25nKSAmYWlycV9pbmZvLT5zdW1tYXJ5X2luZGljYXRvcjsKPiAr
CQkJKHVuc2lnbmVkIGxvbmcpIGdldF9zdW1tYXJ5X2luZGljYXRvcihhaXJxX2luZm8pOwo+ICAg
CQl0aGluaW50X2FyZWEtPmlzYyA9IFZJUlRJT19BSVJRX0lTQzsKPiAgIAkJY2N3LT5jbWRfY29k
ZSA9IENDV19DTURfU0VUX0lORF9BREFQVEVSOwo+ICAgCQljY3ctPmNvdW50ID0gc2l6ZW9mKCp0
aGluaW50X2FyZWEpOwo+IEBAIC02MjQsNyArNjMzLDcgQEAgc3RhdGljIGludCB2aXJ0aW9fY2N3
X3JlZ2lzdGVyX2FkYXB0ZXJfaW5kKHN0cnVjdCB2aXJ0aW9fY2N3X2RldmljZSAqdmNkZXYsCj4g
ICAJfQo+ICAgCWluZm8gPSB2Y2Rldi0+YWlycV9pbmZvOwo+ICAgCXRoaW5pbnRfYXJlYS0+c3Vt
bWFyeV9pbmRpY2F0b3IgPQo+IC0JCSh1bnNpZ25lZCBsb25nKSAmaW5mby0+c3VtbWFyeV9pbmRp
Y2F0b3I7Cj4gKwkJKHVuc2lnbmVkIGxvbmcpIGdldF9zdW1tYXJ5X2luZGljYXRvcihpbmZvKTsK
PiAgIAl0aGluaW50X2FyZWEtPmlzYyA9IFZJUlRJT19BSVJRX0lTQzsKPiAgIAljY3ctPmNtZF9j
b2RlID0gQ0NXX0NNRF9TRVRfSU5EX0FEQVBURVI7Cj4gICAJY2N3LT5mbGFncyA9IENDV19GTEFH
X1NMSTsKPiBAQCAtMTUwMCw2ICsxNTA5LDcgQEAgc3RhdGljIGludCBfX2luaXQgdmlydGlvX2Nj
d19pbml0KHZvaWQpCj4gICB7Cj4gICAJLyogcGFyc2Ugbm9fYXV0byBzdHJpbmcgYmVmb3JlIHdl
IGRvIGFueXRoaW5nIGZ1cnRoZXIgKi8KPiAgIAlub19hdXRvX3BhcnNlKCk7Cj4gKwlzdW1tYXJ5
X2luZGljYXRvcnMgPSBjaW9fZG1hX3phbGxvYyhNQVhfQUlSUV9BUkVBUyk7Cj4gICAJcmV0dXJu
IGNjd19kcml2ZXJfcmVnaXN0ZXIoJnZpcnRpb19jY3dfZHJpdmVyKTsKPiAgIH0KPiAgIGRldmlj
ZV9pbml0Y2FsbCh2aXJ0aW9fY2N3X2luaXQpOwo+IAoKCgotLSAKUGllcnJlIE1vcmVsCkxpbnV4
L0tWTS9RRU1VIGluIELDtmJsaW5nZW4gLSBHZXJtYW55CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
