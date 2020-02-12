Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8F15AD4E
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 17:24:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E7FB86834;
	Wed, 12 Feb 2020 16:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXUFVmjHDHA1; Wed, 12 Feb 2020 16:24:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98BA686866;
	Wed, 12 Feb 2020 16:24:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D40DC0177;
	Wed, 12 Feb 2020 16:24:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44D51C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 33EF38693C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSWS0GiD+84a
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:23:57 +0000 (UTC)
X-Greylist: delayed 12:35:42 by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46B248667B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:23:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u12so1110150pgb.10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 08:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=RPf0qd07XC0OOgOapJr/kDhbr+rGuzMt9BHSs7VK5/M=;
 b=dUeaWcB7fuWIvEKzmYm9b+dMATUK5ExPoVF5uz+XbZrV986c/7ZUKxiELMZyxipwMD
 1RUk/X2dZklh2rOUgrGjHNF1qDI1tftagxZSLDZeZzgJnXon8nHd/5ivrOWxJ2z/Quol
 0fLkLJT9qUyJSI09E6JgFMkBBxxoUuFR2ZoBYCe9KrD28/tVFDRp7HJ80deMqTvy4jc2
 sPljRpie80sjXVDaKmHDRm2v2lVgyQPfm43BcZ9NhdT+n3hvcOemxeUTZvQMiBPEjNiB
 QezheQ9VMb9FKQ0p5qNL3hcNgcu5RQovzjPUuEvlPjHBaCjFoDM0Pa5MHOxqyDTLZACA
 xONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=RPf0qd07XC0OOgOapJr/kDhbr+rGuzMt9BHSs7VK5/M=;
 b=kSGMXnvwCniDXlXVeFc3TGkunFuw6o01KRqz5mloJeVqubmyaA9C0TVTn7LXd0z/67
 4dO+2zIHAHzap3df4/Ty47JS0EZH74LOkFWVeVEsp4nIJJD+mV2YEmx5WaR1g8pNHA/W
 F36p1yjWe38212lNGF2AE17yZlPZ1yh2A4MHw15oZLqsRO041c4Nr71NkRWgKP9FUSkn
 B24sqb9PzwUevG8Dr5eAbFx/FjSNKoB1vUuPJ8JKTjDNY/LRuX61PioK9qAklUEaprbh
 3d96y6cRStDnwVje1SCAdW6cQQNueq+8L1KIiL6O5fhi79+7/7j9SYZBp4VXDZUa3o73
 V7TA==
X-Gm-Message-State: APjAAAWV1KVyPod0uSiaUYeSLNA3m8hcuq2R4vMBNLlav7efCbRyo6ht
 FWHZa3M2OCXSjyIDRWmgHMnsVA==
X-Google-Smtp-Source: APXvYqwA82NVa9GoZoUratpibu79hOk3wllm05r7A8GrU5cq9PSBnDYtIdZEziICapSe7ywBb9awww==
X-Received: by 2002:a65:4305:: with SMTP id j5mr13799109pgq.315.1581524636923; 
 Wed, 12 Feb 2020 08:23:56 -0800 (PST)
Received: from ?IPv6:2601:646:c200:1ef2:6918:d286:95c1:bba2?
 ([2601:646:c200:1ef2:6918:d286:95c1:bba2])
 by smtp.gmail.com with ESMTPSA id s130sm1652186pfc.62.2020.02.12.08.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 08:23:56 -0800 (PST)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 23/62] x86/idt: Move IDT to data segment
Date: Wed, 12 Feb 2020 08:23:54 -0800
Message-Id: <EEAC8672-C98F-45D0-9F2D-0802516C3908@amacapital.net>
References: <20200212115516.GE20066@8bytes.org>
In-Reply-To: <20200212115516.GE20066@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: iPhone Mail (17D50)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

Cgo+IE9uIEZlYiAxMiwgMjAyMCwgYXQgMzo1NSBBTSwgSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRl
cy5vcmc+IHdyb3RlOgo+IAo+IO+7v09uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDAyOjQxOjI1UE0g
LTA4MDAsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0
IDU6NTMgQU0gSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+IHdyb3RlOgo+Pj4gCj4+PiBG
cm9tOiBKb2VyZyBSb2VkZWwgPGpyb2VkZWxAc3VzZS5kZT4KPj4+IAo+Pj4gV2l0aCBTRVYtRVMs
IGV4Y2VwdGlvbiBoYW5kbGluZyBpcyBuZWVkZWQgdmVyeSBlYXJseSwgZXZlbiBiZWZvcmUgdGhl
Cj4+PiBrZXJuZWwgaGFzIGNsZWFyZWQgdGhlIGJzcyBzZWdtZW50LiBJbiBvcmRlciB0byBwcmV2
ZW50IGNsZWFyaW5nIHRoZQo+Pj4gY3VycmVudGx5IHVzZWQgSURULCBtb3ZlIHRoZSBJRFQgdG8g
dGhlIGRhdGEgc2VnbWVudC4KPj4gCj4+IFVnaC4gIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgbmVl
ZHMgYSBjb21tZW50IGluIHRoZSBjb2RlLgo+IAo+IFllcywgcmlnaHQsIGFkZGVkIGEgY29tbWVu
dCBmb3IgdGhhdC4KPiAKPj4gSSBoYWQgYSBwYXRjaCB0byBmaXggdGhlIGtlcm5lbCBFTEYgbG9h
ZGVyIHRvIGNsZWFyIEJTUywgd2hpY2ggd291bGQKPj4gZml4IHRoaXMgcHJvYmxlbSBvbmNlIGFu
ZCBmb3IgYWxsLCBidXQgaXQgZGlkbid0IHdvcmsgZHVlIHRvIHRoZSBtZXNzeQo+PiB3YXkgdGhh
dCB0aGUgZGVjb21wcmVzc29yIGhhbmRsZXMgbWVtb3J5LiAgSSBuZXZlciBnb3QgYXJvdW5kIHRv
Cj4+IGZpeGluZyB0aGlzLCBzYWRseS4KPiAKPiBBcmVuJ3QgdGhlcmUgb3RoZXIgd2F5cyBvZiBi
b290aW5nIChYZW4tUFY/KSB3aGljaCBkb24ndCB1c2UgdGhlIGtlcm5lbAo+IEVMRiBsb2FkZXI/
CgpEdW5uby4gSSB3b3VsZCBob3BlIHRoZSBhbnkgc2FuZSBsb2FkZXIgd291bGQgY2xlYXIgQlNT
IGJlZm9yZSBleGVjdXRpbmcgYW55dGhpbmcuIFRoaXMgaXNu4oCZdCBjdXJyZW50bHkgdGhlIGNh
c2UsIHRob3VnaC4gT2ggd2VsbC4KCj4gCj4gUmVnYXJkcywKPiAKPiAgICBKb2VyZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
