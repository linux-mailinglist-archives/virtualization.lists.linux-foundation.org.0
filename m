Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9F181145
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 07:58:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 62044203B8;
	Wed, 11 Mar 2020 06:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LewduPgUiDe6; Wed, 11 Mar 2020 06:58:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 078432039B;
	Wed, 11 Mar 2020 06:58:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBEF6C0177;
	Wed, 11 Mar 2020 06:58:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6440DC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B18F86AFF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2i26VXyPUpgn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:58:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6681486ACD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:58:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86921AECE;
 Wed, 11 Mar 2020 06:58:50 +0000 (UTC)
Subject: Re: [PATCH RFC v2 02/24] scsi: allocate separate queue for reserved
 commands
To: Christoph Hellwig <hch@infradead.org>, John Garry <john.garry@huawei.com>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-3-git-send-email-john.garry@huawei.com>
 <20200310183243.GA14549@infradead.org>
 <79cf4341-f2a2-dcc9-be0d-2efc6e83028a@huawei.com>
 <20200311062228.GA13522@infradead.org>
From: Hannes Reinecke <hare@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hare@suse.de; prefer-encrypt=mutual; keydata=
 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
 azzYF4VRJsdl+d0MCaSy8mUh
Message-ID: <7bc94a9f-ec86-b343-0951-eba548c71b67@suse.de>
Date: Wed, 11 Mar 2020 07:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200311062228.GA13522@infradead.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMy8xMS8yMCA3OjIyIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBUdWUsIE1h
ciAxMCwgMjAyMCBhdCAwOTowODo1NlBNICswMDAwLCBKb2huIEdhcnJ5IHdyb3RlOgo+PiBPbiAx
MC8wMy8yMDIwIDE4OjMyLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE9uIFdlZCwgTWFy
IDExLCAyMDIwIGF0IDEyOjI1OjI4QU0gKzA4MDAsIEpvaG4gR2Fycnkgd3JvdGU6Cj4+Pj4gRnJv
bTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuY29tPgo+Pj4+Cj4+Pj4gQWxsb2NhdGUgYSBz
ZXBhcmF0ZSAncmVzZXJ2ZWRfY21kX3EnIGZvciBzZW5kaW5nIHJlc2VydmVkIGNvbW1hbmRzLgo+
Pj4KPj4+IFdoeT8gIFJlc2VydmVkIGNvbW1hbmQgc3BlY2lmaWNhbGx5IGFyZSBub3QgaW4gYW55
IHdheSB0aWVkIHRvIHF1ZXVlcy4KPj4+IC4KPj4+Cj4+Cj4+IFNvIHRoZSB2MSBzZXJpZXMgdXNl
ZCBhIGNvbWJpbmF0aW9uIG9mIHRoZSBzZGV2IHF1ZXVlIGFuZCB0aGUgcGVyLWhvc3QKPj4gcmVz
ZXJ2ZWRfY21kX3EuIEJhY2sgdGhlbiB5b3UgcXVlc3Rpb25lZCB1c2luZyB0aGUgc2RldiBxdWV1
ZSBmb3IgdmlydGlvCj4+IHNjc2ksIGFuZCB0aGUgdW5jb25maXJtZWQgY29uY2x1c2lvbiB3YXMg
dG8gdXNlIGEgY29tbW9uIHBlci1ob3N0IHEuIFRoaXMgaXMKPj4gdGhlIGJlc3QgbGluayBJIGNh
biBmaW5kIG5vdzoKPj4KPj4gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9saW51eC1zY3Np
QHZnZXIua2VybmVsLm9yZy9tc2c4MzE3Ny5odG1sCj4gCj4gVGhhdCB3YXMganVzdCBhIHF1ZXN0
aW9uIG9uIHdoeSB2aXJ0aW8gdXNlcyB0aGUgcGVyLWRldmljZSB0YWdzLCB3aGljaAo+IGRpZG4n
dCBsb29rIGxpa2UgaXQgbWFkZSBhbnkgc2Vuc2UuICBXaGF0IEknbSB3b3JyaWVkIGFib3V0IGhl
cmUgaXMKPiBtaXhpbmcgdXAgdGhlIGNvbmNlcHQgb2YgcmVzZXJ2ZWQgdGFncyBpbiB0aGUgdGFn
c2V0LCBhbmQgcXVldWVzIHRvIHVzZQo+IHRoZW0uICBOb3RlIHRoYXQgd2UgYWxyZWFkeSBoYXZl
IHRoZSBzY3NpX2dldF9ob3N0X2RldiB0byBhbGxvY2F0ZQo+IGEgc2NzaV9kZXZpY2UgYW5kIHRo
dXMgYSByZXF1ZXN0X3F1ZXVlIGZvciB0aGUgaG9zdCBpdHNlbGYuICBUaGF0IHNlZW1zCj4gbGlr
ZSB0aGUgYmV0dGVyIGludGVyZmFjZSB0byB1c2UgYSB0YWcgZm9yIGEgaG9zdCB3aWRlIGNvbW1h
bmQgdnMKPiBpbnRyb2R1Y2luZyBhIHBhcmFsbGVsIHBhdGguCj4gCkFoLiBSaWdodC4KV2lsbCBi
ZSBsb29raW5nIGludG8gdGhhdCwgYW5kIGNvbnZlcnQgdGhlIHBhdGNoc2V0IG92ZXIgdG8gaXQu
CgpBbmQgdGhlIHByb2JsZW0gb2YgdGhlIHNlcGFyYXRlIHF1ZXVlIGlzIHRoZSBmYWN0IHRoYXQg
SSdsbCBuZWVkIGEgcXVldWUKdG8gcmVzZXJ2ZSB0YWdzIGZyb207IHRyeWluZyB0byBhbGxvY2F0
ZSBhIHRhZyBkaXJlY3RseSBmcm9tIHRoZSBiaXRtYXAKdHVybnMgb3V0IHRvIGJlIG1ham9yIHN1
cmdlcnkgaW4gdGhlIGJsb2NrbGF5ZXIgd2l0aCBubyBpbW1lZGlhdGUgZ2Fpbi4KQW5kIEkgY2Fu
J3QgdXNlIHBlci1kZXZpY2UgcXVldWVzIGFzIGZvciBzb21lIGRyaXZlcnMgdGhlIHJlc2VydmVk
CmNvbW1hbmRzIGFyZSB1c2VkIHRvIHF1ZXJ5IHRoZSBIQkEgaXRzZWxmIHRvIGZpZ3VyZSBvdXQg
aG93IG1hbnkgZGV2aWNlcwphcmUgcHJlc2VudC4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhh
bm5lcyBSZWluZWNrZQkJICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBz
dXNlLmRlCQkJICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcK
SFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHRjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
