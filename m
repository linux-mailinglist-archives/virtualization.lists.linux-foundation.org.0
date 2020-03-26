Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 784021939DF
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 08:54:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B506488924;
	Thu, 26 Mar 2020 07:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7CxK8GpcItX; Thu, 26 Mar 2020 07:54:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E552885B9;
	Thu, 26 Mar 2020 07:54:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F39F4C0177;
	Thu, 26 Mar 2020 07:54:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8DB4C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D544A84D5E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGuzhnxPYoFL
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:54:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4C7D884D56
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585209248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewe17eOYdz4EvmwE26373XLT8s4P4W/Qf8XDkOh2IQo=;
 b=hDINUazU0KaHDcugED7XVYdlaZxmsw48+m4Waz33YufIGuZ/Qs19J4AdT2tq12y7KvfHsV
 WcIgfABdb4gd3cCAWUdXmOjlLcldZz1we8gYUsOF/P/WVZvMtL12M01znhIxqULBzplp22
 clHmJoUuGUzqBW9P+l8QDV8xH20fuls=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-o4e-kgEdOmOujVh3wcye5A-1; Thu, 26 Mar 2020 03:54:07 -0400
X-MC-Unique: o4e-kgEdOmOujVh3wcye5A-1
Received: by mail-wr1-f71.google.com with SMTP id b11so2603612wru.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 00:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Qql73jNfeDPnZ1XbHZy/14bgCxWzkLKp7JWHPRCQOTQ=;
 b=QMw+HXbsHvAiVk1AG0oZrwyYQc+5lp7YIju+Q4J+V9cBKnvgvdw4HlHEriYM8PyUn5
 2NME9Nr5ouJoINg0CfXSQy302m69m8gOUONzv/8F+wzCztYcOdBi1MM3KtR9M96WJVSi
 ozT/lsxIG06PVlKijjF6sB/gjN8WmCvw++TG7YVDDw9i84hxflx7SPWqlnOWCxMlJkl7
 GspXdzoPrG5UgqPaFKJHEjicD0e0h9H+dH7A67Jo4Rn2YTH4xMyldkttE/BZgKfiNCxz
 LPb9pyViTg9Q8wAuqZG2oGsJqrsrwi19fEqoUn8ZALmWt8ob9yTgRO7R72qY2K3LN9vp
 Xw2Q==
X-Gm-Message-State: ANhLgQ3332f0oJubcygzG6Sf5NHTSSwhBsN23erL1bUXNFzL1KaMYIGO
 WBqEgsw9yhz9CrNGkKGf7PI9yh7YjEOH4NtrxWrG2KbA/3XykB/mJ+SfuJbF33r0hehOy/3+Ubf
 U41oRE+kY/JEVDw0EZkRQCTSldPOCmVm8KLTZlwkDKA==
X-Received: by 2002:a1c:5506:: with SMTP id j6mr1794733wmb.127.1585209246376; 
 Thu, 26 Mar 2020 00:54:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsFiiPx40ICgltZ/bol/CKCo9kj2UWVxCUn27QCXL8zjviDH6XzIhY9x6yyTt09drMK3JIEew==
X-Received: by 2002:a1c:5506:: with SMTP id j6mr1794715wmb.127.1585209246127; 
 Thu, 26 Mar 2020 00:54:06 -0700 (PDT)
Received: from [192.168.3.122] (p5B0C669F.dip0.t-ipconnect.de. [91.12.102.159])
 by smtp.gmail.com with ESMTPSA id c189sm2366124wmd.12.2020.03.26.00.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 00:54:05 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER to
 handle THP spilt issue
Date: Thu, 26 Mar 2020 08:54:04 +0100
Message-Id: <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
References: <20200326031817-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200326031817-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: iPhone Mail (17D50)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

Cgo+IEFtIDI2LjAzLjIwMjAgdW0gMDg6MjEgc2NocmllYiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjoKPiAKPiDvu79PbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAwOTo1MToyNUFN
ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+IE9uIDEyLjAzLjIwIDA5OjQ3LCBN
aWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBPbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAwOToz
NzozMkFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+PiAyLiBZb3UgYXJlIGVz
c2VudGlhbGx5IHN0ZWFsaW5nIFRIUHMgaW4gdGhlIGd1ZXN0LiBTbyB0aGUgZmFzdGVzdAo+Pj4+
IG1hcHBpbmcgKFRIUCBpbiBndWVzdCBhbmQgaG9zdCkgaXMgZ29uZS4gVGhlIGd1ZXN0IHdvbid0
IGJlIGFibGUgdG8gbWFrZQo+Pj4+IHVzZSBvZiBUSFAgd2hlcmUgaXQgcHJldmlvdXNseSB3YXMg
YWJsZSB0by4gSSBjYW4gaW1hZ2luZSB0aGlzIGltcGxpZXMgYQo+Pj4+IHBlcmZvcm1hbmNlIGRl
Z3JhZGF0aW9uIGZvciBzb21lIHdvcmtsb2Fkcy4gVGhpcyBuZWVkcyBhIHByb3Blcgo+Pj4+IHBl
cmZvcm1hbmNlIGV2YWx1YXRpb24uCj4+PiAKPj4+IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgbW9y
ZSB3aXRoIHRoZSBhbGxvY19wYWdlcyBBUEkuCj4+PiBUaGF0IGdpdmVzIHlvdSBleGFjdGx5IHRo
ZSBnaXZlbiBvcmRlciwgYW5kIGlmIHRoZXJlJ3MKPj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJs
ZSwgaXQgd2lsbCBzcGxpdCBpdCB1cC4KPj4+IAo+Pj4gQnV0IGZvciBiYWxsb29uIC0gSSBzdXNw
ZWN0IGxvdHMgb2Ygb3RoZXIgdXNlcnMsCj4+PiB3ZSBkbyBub3Qgd2FudCB0byBzdHJlc3MgdGhl
IHN5c3RlbSBidXQgaWYgYSBsYXJnZQo+Pj4gY2h1bmsgaXMgYXZhaWxhYmxlIGFueXdheSwgdGhl
biB3ZSBjb3VsZCBoYW5kbGUKPj4+IHRoYXQgbW9yZSBvcHRpbWFsbHkgYnkgZ2V0dGluZyBpdCBh
bGwgaW4gb25lIGdvLgo+Pj4gCj4+PiAKPj4+IFNvIGlmIHdlIHdhbnQgdG8gYWRkcmVzcyB0aGlz
LCBJTUhPIHRoaXMgY2FsbHMgZm9yIGEgbmV3IEFQSS4KPj4+IEFsb25nIHRoZSBsaW5lcyBvZgo+
Pj4gCj4+PiAgICBzdHJ1Y3QgcGFnZSAqYWxsb2NfcGFnZV9yYW5nZShnZnBfdCBnZnAsIHVuc2ln
bmVkIGludCBtaW5fb3JkZXIsCj4+PiAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1h
eF9vcmRlciwgdW5zaWduZWQgaW50ICpvcmRlcikKPj4+IAo+Pj4gdGhlIGlkZWEgd291bGQgdGhl
biBiZSB0byByZXR1cm4gYXQgYSBudW1iZXIgb2YgcGFnZXMgaW4gdGhlIGdpdmVuCj4+PiByYW5n
ZS4KPj4+IAo+Pj4gV2hhdCBkbyB5b3UgdGhpbms/IFdhbnQgdG8gdHJ5IGltcGxlbWVudGluZyB0
aGF0Pwo+PiAKPj4gWW91IGNhbiBqdXN0IHN0YXJ0IHdpdGggdGhlIGhpZ2hlc3Qgb3JkZXIgYW5k
IGRlY3JlbWVudCB0aGUgb3JkZXIgdW50aWwKPj4geW91ciBhbGxvY2F0aW9uIHN1Y2NlZWRzIHVz
aW5nIGFsbG9jX3BhZ2VzKCksIHdoaWNoIHdvdWxkIGJlIGVub3VnaCBmb3IKPj4gYSBmaXJzdCB2
ZXJzaW9uLiBBdCBsZWFzdCBJIGRvbid0IHNlZSB0aGUgaW1tZWRpYXRlIG5lZWQgZm9yIGEgbmV3
Cj4+IGtlcm5lbCBBUEkuCj4gCj4gT0sgSSByZW1lbWJlciBub3cuICBUaGUgcHJvYmxlbSBpcyB3
aXRoIHJlY2xhaW0uIFVubGVzcyByZWNsYWltIGlzCj4gY29tcGxldGVseSBkaXNhYmxlZCwgYW55
IG9mIHRoZXNlIGNhbGxzIGNhbiBzbGVlcC4gQWZ0ZXIgaXQgd2FrZXMgdXAsCj4gd2Ugd291bGQg
bGlrZSB0byBnZXQgdGhlIGxhcmdlciBvcmRlciB0aGF0IGhhcyBiZWNvbWUgYXZhaWxhYmxlCj4g
bWVhbndoaWxlLgo+IAoKWWVzLCBidXQgdGhhdOKAmHMgYSBwdXJlIG9wdGltaXphdGlvbiBJTUhP
LgoKU28gSSB0aGluayB3ZSBzaG91bGQgZG8gYSB0cml2aWFsIGltcGxlbWVudGF0aW9uIGZpcnN0
IGFuZCB0aGVuIHNlZSB3aGF0IHdlIGdhaW4gZnJvbSBhIG5ldyBhbGxvY2F0b3IgQVBJLiBUaGVu
IHdlIG1pZ2h0IGFsc28gYmUgYWJsZSB0byBqdXN0aWZ5IGl0IHVzaW5nIHJlYWwgbnVtYmVycy4K
Cj4gCj4+IC0tIAo+PiBUaGFua3MsCj4+IAo+PiBEYXZpZCAvIGRoaWxkZW5iCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
