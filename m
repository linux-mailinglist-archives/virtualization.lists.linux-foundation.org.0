Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BF15AD37
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 17:22:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE31D86834;
	Wed, 12 Feb 2020 16:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D58MRpMMqnND; Wed, 12 Feb 2020 16:22:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 636C98682C;
	Wed, 12 Feb 2020 16:22:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43F8FC0177;
	Wed, 12 Feb 2020 16:22:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91D69C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B0B720767
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4D1IQlzaZvIx
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:22:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id C8CC320477
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:22:17 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so1470296pfa.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 08:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=UtBs909g2Ug5B/GmWLl9syqH2ckGGAYGctQB3xVEPLk=;
 b=V0nJ4J4nOpEq7kQ1dqdvmNnRxG670BfZwH5PqrHNkdmszKt+Nuf5IkDfEPLa6hHtjy
 oQ/5HvIyGCUiyO+DKLpmEhjIaRtaMGsX4Ho4j+g5PEHbDGEU4EJj2lBNBfX3LEUu9h39
 U7haCGvFvvtAEpjYU7/qWar6H5YvcL/BQUp2/+6JPuTRlsj3hgsVKRDQdiJerCImp4VP
 9O/2vHiw/xH7JQHP6NWurerQCjwskocQQpbyiomB2Q4aqgBGsB4wCYS4fgUtTV5EJVqO
 a9lsRy8l7mxCuMF2IuG8tVVKQVL4K7Y4LzMZWYykNg9SJMfePai7QvvlNM7P3AxhiqI8
 2brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=UtBs909g2Ug5B/GmWLl9syqH2ckGGAYGctQB3xVEPLk=;
 b=AjR+/+GEqyk1Jmz9haS471L7OyZzzZ8WB2rpjxPcHmXNBLJatSeBbGcVev8Bh4Aond
 PkAtlnjlqwEsu9n0DJcKqnCQB2eZUO8lqDqnYOhLg3T8tPe7BImDaDu5MPglH5fTAxOu
 qfmYwPizWxFXHNn+UcshiHBbmUWO2zuC57tOm54ABSgTtT+koUw3kcgYsecr1DJ7N3M2
 0tt2aR7EZqCtqyz02DZS/BlV/xr5jQcgkxqsrXdNJwAT4HnzAYsQMgGLcxoAoA+3NGv5
 7au1sNqu0s0iXhB6p2sjmJXITGJljRJULMQ8D9MBOYVeJ6GGgF2intQ8PXOmCcvV6OVN
 cJmQ==
X-Gm-Message-State: APjAAAW6U30QfGvJ5C2RTJ/YfauCA7mXGzZivSq6HCeEO9w/eaoq/+HP
 GIseZtsly9qIy506Vpk7imz0uQ==
X-Google-Smtp-Source: APXvYqyksnxVfiGQnmL2dJDTJhvH3Jj2OjnrG6wn2hFFnBKljhf5Nl9AB7BmudDVKXJXj5Ka8PadqA==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr9202566pfo.45.1581524537390;
 Wed, 12 Feb 2020 08:22:17 -0800 (PST)
Received: from ?IPv6:2601:646:c200:1ef2:6918:d286:95c1:bba2?
 ([2601:646:c200:1ef2:6918:d286:95c1:bba2])
 by smtp.gmail.com with ESMTPSA id z19sm1429801pfn.49.2020.02.12.08.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 08:22:16 -0800 (PST)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 14/62] x86/boot/compressed/64: Add stage1 #VC handler
Date: Wed, 12 Feb 2020 08:22:14 -0800
Message-Id: <A67CC291-C07A-496C-BD67-2A795813E93F@amacapital.net>
References: <20200212113840.GB20066@8bytes.org>
In-Reply-To: <20200212113840.GB20066@8bytes.org>
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

Cgo+IE9uIEZlYiAxMiwgMjAyMCwgYXQgMzozOCBBTSwgSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRl
cy5vcmc+IHdyb3RlOgo+IAo+IO+7v09uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDAyOjIzOjIyUE0g
LTA4MDAsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0
IDU6NTMgQU0gSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+IHdyb3RlOgo+Pj4gK3ZvaWQg
X19pbml0IG5vX2doY2JfdmNfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gCj4+IElz
bid0IHRoZXJlIGEgc2Vjb25kIHBhcmFtZXRlcjogdW5zaWduZWQgbG9uZyBlcnJvcl9jb2RlPwo+
IAo+IE5vLCB0aGUgZnVuY3Rpb24gZ2V0cyB0aGUgZXJyb3ItY29kZSBmcm9tIHJlZ3MtPm9yaWdf
YXguIFRoaXMgcGFydGljdWxhcgo+IGZ1bmN0aW9uIG9ubHkgbmVlZHMgdG8gY2hlY2sgZm9yIGVy
cm9yX2NvZGUgPT0gU1ZNX0VYSVRfQ1BVSUQsIGFzIHRoYXQKPiBpcyB0aGUgb25seSBvbmUgc3Vw
cG9ydGVkIHdoZW4gdGhlcmUgaXMgbm8gR0hDQi4KPiAKCkhtbS4gSXQgbWlnaHQgYmUgbmljZSB0
byB1c2UgdGhlIHNhbWUgc2lnbmF0dXJlIGZvciBlYXJseSBoYW5kbGVycyBhcyBmb3Igbm9ybWFs
IG9uZXMuCgo+IFJlZ2FyZHMsCj4gCj4gICAgSm9lcmcKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
