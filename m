Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3B1B5E44
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 16:49:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4D3687D9D;
	Thu, 23 Apr 2020 14:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne4S7j1vmFrN; Thu, 23 Apr 2020 14:49:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1DD9587E5F;
	Thu, 23 Apr 2020 14:49:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3A55C0175;
	Thu, 23 Apr 2020 14:49:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22911C0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0FF5F87DB3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2JX0RimrgV3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:49:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 06DD387D9D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:49:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A8A9ABB2;
 Thu, 23 Apr 2020 14:49:03 +0000 (UTC)
Subject: Re: [PATCH RFC v2 02/24] scsi: allocate separate queue for reserved
 commands
To: John Garry <john.garry@huawei.com>, Christoph Hellwig <hch@infradead.org>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-3-git-send-email-john.garry@huawei.com>
 <20200310183243.GA14549@infradead.org>
 <79cf4341-f2a2-dcc9-be0d-2efc6e83028a@huawei.com>
 <20200311062228.GA13522@infradead.org>
 <b5a63725-722b-8ccd-3867-6db192a248a4@suse.de>
 <9c6ced82-b3f1-9724-b85e-d58827f1a4a4@huawei.com>
 <39bc2d82-2676-e329-5d32-8acb99b0a204@suse.de>
 <20200407163033.GA26568@infradead.org>
 <ae3b498b-aea8-dc09-53b8-9e160effc681@huawei.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <a0316b0b-a24c-7d0c-df17-0573593e2a11@suse.de>
Date: Thu, 23 Apr 2020 16:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ae3b498b-aea8-dc09-53b8-9e160effc681@huawei.com>
Content-Language: en-US
Cc: axboe@kernel.dk, Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

T24gNC8yMy8yMCA0OjEzIFBNLCBKb2huIEdhcnJ5IHdyb3RlOgo+IE9uIDA3LzA0LzIwMjAgMTc6
MzAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+PiBPbiBUdWUsIEFwciAwNywgMjAyMCBhdCAw
NDowMDoxMFBNICswMjAwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+PiBNeSBjb25jZXJuIGlz
IHRoaXM6Cj4+Pgo+Pj4gc3RydWN0IHNjc2lfZGV2aWNlICpzY3NpX2dldF9ob3N0X2RldihzdHJ1
Y3QgU2NzaV9Ib3N0ICpzaG9zdCkKPj4+IHsKPj4+IMKgwqDCoMKgWyAuLiBdCj4+PiDCoMKgwqDC
oHN0YXJnZXQgPSBzY3NpX2FsbG9jX3RhcmdldCgmc2hvc3QtPnNob3N0X2dlbmRldiwgMCwgCj4+
PiBzaG9zdC0+dGhpc19pZCk7Cj4+PiDCoMKgwqDCoFsgLi4gXQo+Pj4KPj4+IGFuZCB3ZSBoYXZl
IHR5cGljYWxseToKPj4+Cj4+PiBkcml2ZXJzL3Njc2kvaGlzaV9zYXMvaGlzaV9zYXNfdjNfaHcu
YzogLnRoaXNfaWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAtMSwKPj4+Cj4+PiBJ
dCdzIF92ZXJ5XyB1bmNvbW1vbiB0byBoYXZlIGEgbmVnYXRpdmUgbnVtYmVyIGFzIHRoZSBTQ1NJ
IHRhcmdldCAKPj4+IGRldmljZTsgaW4KPj4+IGZhY3QsIGl0IF9pc18gYW4gdW5zaWduZWQgaW50
IGFscmVhZHkuCj4+Pgo+Pj4gQnV0IGFscmlnaHQsIEknbGwgZ2l2ZSBpdCBhIGdvOyBsZXQncyBz
ZWUgd2hhdCBJJ2xsIGVuZCB1cCB3aXRoLgo+Pgo+PiBCdXQgdGhpcyBzaG91bGRuJ3QgYmUgZXhw
b3NlZCBhbnl3aGVyZS7CoCBBbmQgSSBwcmVmZXIgdGhhdCBvdmVyIGhhdmluZwo+PiBtYWdpYyBy
ZXF1ZXN0cy9zY3NpX2NtbmQgdGhhdCBkbyBub3QgaGF2ZSBhIHZhbGlkIC0+ZGV2aWNlIHBvaW50
ZXIuCj4+IC4KPj4KPiAKPiAoanVzdCBsb29raW5nIGF0IHRoaXMgYWdhaW4pCj4gCj4gSGkgQ2hy
aXN0b3BoLAo+IAo+IFNvIGhvdyB3b3VsZCB0aGlzIGxvb2sgYWRkZWQgaW4gc2NzaV9saWIuYzoK
PiAKPiBzdHJ1Y3Qgc2NzaV9jbW5kICpzY3NpX2dldF9yZXNlcnZlZF9jbWQoc3RydWN0IFNjc2lf
SG9zdCAqc2hvc3QpCj4gewo+ICDCoMKgwqDCoHN0cnVjdCBzY3NpX2NtbmQgKnNjbWQ7Cj4gIMKg
wqDCoMKgc3RydWN0IHJlcXVlc3QgKnJxOwo+ICDCoMKgwqDCoHN0cnVjdCBzY3NpX2RldmljZSAq
c2RldiA9IHNjc2lfZ2V0X2hvc3RfZGV2KHNob3N0KTsKPiAKPiAgwqDCoMKgwqBpZiAoIXNkZXYp
Cj4gIMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOwo+IAo+ICDCoMKgwqDCoHJxID0gYmxrX21x
X2FsbG9jX3JlcXVlc3Qoc2Rldi0+cmVxdWVzdF9xdWV1ZSwKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBSRVFfT1BfRFJWX09VVCB8IFJFUV9OT1dBSVQsCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQkxLX01RX1JFUV9SRVNFUlZFRCk7Cj4gIMKgwqDC
oMKgaWYgKElTX0VSUihycSkpIC8vIGZpeCB0aWR5LXVwCj4gIMKgwqDCoMKgwqDCoMKgIHJldHVy
biBOVUxMOwo+ICDCoMKgwqDCoFdBUk5fT04ocnEtPnRhZyA9PSAtMSk7Cj4gIMKgwqDCoMKgc2Nt
ZCA9IGJsa19tcV9ycV90b19wZHUocnEpOwo+ICDCoMKgwqDCoHNjbWQtPnJlcXVlc3QgPSBycTsK
PiAgwqDCoMKgwqBzY21kLT5kZXZpY2UgPSBzZGV2Owo+IAo+ICDCoMKgwqDCoHJldHVybiBzY21k
Owo+IH0KPiBFWFBPUlRfU1lNQk9MX0dQTChzY3NpX2dldF9yZXNlcnZlZF9jbWQpOwo+IAo+IHZv
aWQgc2NzaV9wdXRfcmVzZXJ2ZWRfY21kKHN0cnVjdCBzY3NpX2NtbmQgKnNjbWQpCj4gewo+ICDC
oMKgwqDCoHN0cnVjdCByZXF1ZXN0ICpycSA9IGJsa19tcV9ycV9mcm9tX3BkdShzY21kKTsKPiAK
PiAgwqDCoMKgwqBpZiAoYmxrX21xX3JxX2lzX3Jlc2VydmVkKHJxKSkgewo+ICDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3Qgc2NzaV9kZXZpY2UgKnNkZXYgPSBzY21kLT5kZXZpY2U7Cj4gIMKgwqDCoMKg
wqDCoMKgIGJsa19tcV9mcmVlX3JlcXVlc3QocnEpOwo+ICDCoMKgwqDCoMKgwqDCoCBzY3NpX2Zy
ZWVfaG9zdF9kZXYoc2Rldik7Cj4gIMKgwqDCoMKgfQo+IH0KPiBFWFBPUlRfU1lNQk9MX0dQTChz
Y3NpX3B1dF9yZXNlcnZlZF9jbWQpOwo+IAo+IE5vdCBzdXJlIGlmIHdlIHdhbnQgYSBzdGF0aWMg
c2NzaV9kZXZpY2UgcGVyIGhvc3QsIG9yIGFsbG9jIGFuZCBmcmVlIAo+IGR5bmFtaWNhbGx5Lgo+
IAo+IChASGFubmVzLCBJIGFsc28gaGF2ZSBzb21lIHByb3BlciBwYXRjaGVzIGZvciBsaWJzYXMg
aWYgeW91IHdhbnQgdG8gYWRkIGl0KQo+IApIb2xkIHlvdXIgaG9yc2VzLgpJJ20gY3VycmVudGx5
IHByZXBhcmluZyBhIHBhdGNoc2V0IGltcGxlbWVudGluZyB0aGluZ3MgYnkgaW1wcm92aW5nIHRo
ZSAKY3VycmVudCBzY3NpX2dldF9ob3N0X2RldigpIGV0Yy4KClJGQyBzaG91bGQgYmUgcmVhZHkg
YnkgdGhlIGVuZCBvZiB0aGUgd2Vlay4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBS
ZWluZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3Vz
ZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcK
SFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTD
tnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
