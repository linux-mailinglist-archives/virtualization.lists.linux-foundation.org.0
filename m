Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC191A0F7C
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 16:45:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF37D844F1;
	Tue,  7 Apr 2020 14:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK3jx-Mgx8di; Tue,  7 Apr 2020 14:45:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 194BE877E7;
	Tue,  7 Apr 2020 14:45:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2005C1D8D;
	Tue,  7 Apr 2020 14:45:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF713C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BCB588783F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23-w2FwsbjTV
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D73187852
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:45:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8583BAB64;
 Tue,  7 Apr 2020 14:45:05 +0000 (UTC)
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
 <20ebe296-9e57-b3e3-21b3-63a09ce86036@huawei.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <dcfba0ea-4ba5-4e4f-150d-24bd4fe11cdd@suse.de>
Date: Tue, 7 Apr 2020 16:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20ebe296-9e57-b3e3-21b3-63a09ce86036@huawei.com>
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

T24gNC83LzIwIDQ6MzUgUE0sIEpvaG4gR2Fycnkgd3JvdGU6Cj4gT24gMDcvMDQvMjAyMCAxNTow
MCwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBPbiA0LzcvMjAgMTo1NCBQTSwgSm9obiBHYXJy
eSB3cm90ZToKPj4+IE9uIDA2LzA0LzIwMjAgMTA6MDUsIEhhbm5lcyBSZWluZWNrZSB3cm90ZToK
WyAuLiBdCj4+Pj4gVGhpcyB3b3VsZCBiZSBva2F5IGlmICd0aGlzX2lkJyB3b3VsZCBoYXZlIGJl
ZW4gZGVmaW5lZCBieSB0aGUgZHJpdmVyOwo+Pj4+IHNhZGx5LCBtb3N0IGRyaXZlcnMgd2hpY2gg
YXJlIGFmZmVjdGVkIGhlcmUgZG8gc2V0ICd0aGlzX2lkJyB0byAtMS4KPj4+PiBTbyB3ZSB3b3Vs
ZG4ndCBoYXZlIGEgbmljZSB0YXJnZXQgSUQgdG8gYWxsb2NhdGUgdGhlIGRldmljZSBmcm9tLCBs
ZXQKPj4+PiBhbG9uZSB0aGUgcHJvYmxlbSB0aGF0IHdlIHdvdWxkIGhhdmUgdG8gZW11bGF0ZSBh
IGNvbXBsZXRlIHNjc2kgZGV2aWNlCj4+Pj4gd2l0aCBhbGwgcmVxdWlyZWQgbWluaW1hbCBjb21t
YW5kIHN1cHBvcnQgZXRjLgo+Pj4+IEFuZCBJJ20gbm90IHF1aXRlIHN1cmUgaG93IHdlbGwgdGhh
dCB3b3VsZCBwbGF5IHdpdGggdGhlIGV4aXNpbmcgU0NTSQo+Pj4+IGhvc3QgdGVtcGxhdGU7IHRo
ZSBkZXZpY2Ugd2UnbGwgYmUgYWxsb2NhdGluZyB3b3VsZCBoYXZlIGJhc2ljYWxseQo+Pj4+IG5v
dGhpbmcgaW4gY29tbW9uIHdpdGggdGhlICdub3JtYWwnIFNDU0kgZGV2aWNlcy4KPj4+Pgo+Pj4+
IFdoYXQgd2UgY291bGQgZG8sIHRob3VnaCwgaXMgdG8gdHJ5IGl0IHRoZSBvdGhlciB3YXkgcm91
bmQ6Cj4+Pj4gTGlmdCB0aGUgcmVxdWVzdCBxdWV1ZSBmcm9tIHNjc2lfZ2V0X2hvc3RfZGV2KCkg
aW50byB0aGUgc2NzaSBob3N0Cj4+Pj4gaXRzZWxmLCBzbyB0aGF0IHNjc2lfZ2V0X2hvc3RfZGV2
KCkgY2FuIHVzZSB0aGF0IHF1ZXVlLCBidXQgd2UgYWxzbwo+Pj4+IHdvdWxkIGJlIGFibGUgdG8g
dXNlIGl0IHdpdGhvdXQgYSBTQ1NJIGRldmljZSBhdHRhY2hlZC4KPj4+Cj4+PiB3b3VsZG4ndCB0
aGF0IGxpbWl0IDF4IHNjc2kgZGV2aWNlIHBlciBob3N0LCBub3QgdGhhdCBJIGtub3cgaWYgYW55
IAo+Pj4gbW9yZSB3b3VsZCBldmVyIGJlIHJlcXVpcmVkPyBCdXQgaXQgZG9lcyBzdGlsbCBzZWVt
IGJldHRlciB0byB1c2UgdGhlIAo+Pj4gcmVxdWVzdCBxdWV1ZSBpbiB0aGUgc2NzaSBkZXZpY2Uu
Cj4+Pgo+PiBNeSBjb25jZXJuIGlzIHRoaXM6Cj4+Cj4+IHN0cnVjdCBzY3NpX2RldmljZSAqc2Nz
aV9nZXRfaG9zdF9kZXYoc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QpCj4+IHsKPj4gwqDCoMKgwqDC
oFsgLi4gXQo+PiDCoMKgwqDCoMKgc3RhcmdldCA9IHNjc2lfYWxsb2NfdGFyZ2V0KCZzaG9zdC0+
c2hvc3RfZ2VuZGV2LCAwLCAKPj4gc2hvc3QtPnRoaXNfaWQpOwo+PiDCoMKgwqDCoMKgWyAuLiBd
Cj4+Cj4+IGFuZCB3ZSBoYXZlIHR5cGljYWxseToKPj4KPj4gZHJpdmVycy9zY3NpL2hpc2lfc2Fz
L2hpc2lfc2FzX3YzX2h3LmM6IC50aGlzX2lkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ID0gLTEsCj4+Cj4+IEl0J3MgX3ZlcnlfIHVuY29tbW9uIHRvIGhhdmUgYSBuZWdhdGl2ZSBudW1i
ZXIgYXMgdGhlIFNDU0kgdGFyZ2V0IAo+PiBkZXZpY2U7IGluIGZhY3QsIGl0IF9pc18gYW4gdW5z
aWduZWQgaW50IGFscmVhZHkuCj4+Cj4gCj4gRldJVywgdGhlIG9ubHkgb3RoZXIgZHJpdmVyIChn
ZHRoKSB3aGljaCBJIHNlZSB1c2VzIHRoaXMgQVBJIGhhcyB0aGlzX2lkIAo+ID0gLTEgaW4gdGhl
IHNjc2kgaG9zdCB0ZW1wbGF0ZS4KPiAKPj4gQnV0IGFscmlnaHQsIEknbGwgZ2l2ZSBpdCBhIGdv
OyBsZXQncyBzZWUgd2hhdCBJJ2xsIGVuZCB1cCB3aXRoLgo+IAo+IG5vdGU6IElmIHdlIHdhbnQg
YSBmaXhlZCBzY3NpX2RldmljZSBwZXIgaG9zdCwgY2FsbGluZyAKPiBzY3NpX21xX3NldHVwX3Rh
Z3MoKSAtPiBzY3NpX2dldF9ob3N0X2RldigpIHdpbGwgZmFpbCBhcyBzaG9zdCBzdGF0ZSBpcyAK
PiBub3QgcnVubmluZy4gTWF5YmUgd2UgbmVlZCB0byBqdWdnbGUgc29tZSB0aGluZ3MgdGhlcmUg
dG8gcHJvdmlkZSBhIAo+IGdlbmVyaWMgc29sdXRpb24uCj4gCkl0IG1pZ2h0IGV2ZW4gZ2V0IHdv
cnNlLCBhcyBkdXJpbmcgZGV2aWNlIHNldHVwIHRoaW5ncyBsaWtlIAonc2xhdmVfYWxsb2MnIGV0
YyBpcyBnZXR0aW5nIGNhbGxlZCwgd2hpY2ggaGFzIGEgZmFpciBjaGFuY2Ugb2YgZ2V0dGluZyAK
Y29uZnVzZWQgZm9yIG5vbi1leGlzdGluZyBkZXZpY2VzLgpDZiBxbGEyeHh4OnFsYTJ4eF9zbGF2
ZV9hbGxvYygpIGlzIGNhbGxpbmcgc3RhcmdldF90b19ycG9ydCgpLCB3aGljaCAKd2lsbCBnZXQg
dXMgYSBuaWNlIG9vcHMgd2hlbiBhY2Nlc3NpbmcgYSB0YXJnZXQgd2hpY2ggaXMgX25vdF8gdGhl
IGNoaWxkIApvZiBhIGZjIHJlbW90ZSBwb3J0LgpBbmQgdGhpcyBpcyB3aHkgSSdtIG5vdCB1dHRl
cmx5IGtlZW4gb24gdGhpcyBhcHByb2FjaDsgYXVkaXRpbmcgYWxsIAp0aGVzZSBjYWxsYmFja3Mg
aXMgX25vdF8gZnVuLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAg
ICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
