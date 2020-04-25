Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6D1B8946
	for <lists.virtualization@lfdr.de>; Sat, 25 Apr 2020 22:12:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 95DB7204AA;
	Sat, 25 Apr 2020 20:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYw914YKXChb; Sat, 25 Apr 2020 20:12:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C582720519;
	Sat, 25 Apr 2020 20:12:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EF66C0175;
	Sat, 25 Apr 2020 20:12:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A37EC0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 85C1B85D48
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1exbMZL3Qfbw
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:12:44 +0000 (UTC)
X-Greylist: delayed 00:17:32 by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8815185D37
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:12:44 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c3so19022786otp.8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 13:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=su/TZCdqsGvDX9O/dILShocQiIYHImvs41WopVEj3dw=;
 b=HSXwK1S0RYPgtPSMNgcEjmafSf61If+0xsLS+GSFa2PueznsCEQ0seads/QyC49eam
 ChF2VREKs79Xr2/x1ZXz/hxctXZzXzSm+dKeuSZ95p5d0d9wlWufoRlNviyr31NcTuPi
 ds/VTJnblzlXan6xNWu5FVl05hOJTzbCmH7FnIrRgzN9MwKqO7iu7VFWv8xkBoY6GpDl
 Jznip7aJE891SixfzCyH9GiFuwWvLoOukW3NU363SZ3X+hewceNu0/cauA9MStDr+tgz
 ndotP6Bq4jE6rI35SQCmWMndOsi1yWHYH0/LiDg6y8dKccC3HNc4Yb/re7xLVArFp9Cf
 9afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=su/TZCdqsGvDX9O/dILShocQiIYHImvs41WopVEj3dw=;
 b=ft/ZnFm8ANpv6DsSfWKIqSnlysFHbCqvu/orCSvMZyLbbzlPIDWJRqwfNW7xSK96cX
 vqceseiSgZ97im1BYZIS4TIT775miphzGG3giJ2cph49iHKOh/Yf1A0EBn8FL/NtSzDt
 sK9INA8m84dVEfG7nx1Od6gYBbii+8wVN1ucY4S8tS1X5/+KCTAASd+jk55nWTZFK/Ky
 palrR3hXamVQ/k0jbyPppYqvZTzPL9aKkbAYWgoQQb2vgo0jjxVnRI4tLyUtPB3gjmaR
 9L3g9CYWa2rXpGwwNjkFZ7Qmn+M3rvNgrAtBOibsZ55PkRqKpEbLg5stC+yta32Dc4u3
 8YOQ==
X-Gm-Message-State: AGi0PuYoI/pcH404hgHQPP3CPQKRRVzzQeT8D7xwknSrkf9HkjAYCZFe
 s1Vw/2Hli7mdNdnIf0vHf0k4+ETwQAE=
X-Google-Smtp-Source: APiQypKEMhdWCQosOVFNGGvelzt3tcfdxzwTQ4wUUFKoxDVH8RdkAuEGYoNGN00zKueIqusTJ5+Cmg==
X-Received: by 2002:a17:90a:d984:: with SMTP id
 d4mr14044440pjv.59.1587844054298; 
 Sat, 25 Apr 2020 12:47:34 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:d16f:990f:8780:729d?
 ([2601:646:c200:1ef2:d16f:990f:8780:729d])
 by smtp.gmail.com with ESMTPSA id b2sm7567961pgg.77.2020.04.25.12.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 12:47:33 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
Date: Sat, 25 Apr 2020 12:47:31 -0700
Message-Id: <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
References: <20200425191032.GK21900@8bytes.org>
In-Reply-To: <20200425191032.GK21900@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: iPhone Mail (17E262)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>, X86 ML <x86@kernel.org>
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

Cgo+IE9uIEFwciAyNSwgMjAyMCwgYXQgMTI6MTAgUE0sIEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0
ZXMub3JnPiB3cm90ZToKPiAKPiDvu79PbiBTYXQsIEFwciAyNSwgMjAyMCBhdCAxMToxNTozNUFN
IC0wNzAwLCBBbmR5IEx1dG9taXJza2kgd3JvdGU6Cj4+IHNoaWZ0X2lzdCBpcyBncm9zcy4gIFdo
YXQncyBpdCBmb3I/ICBJZiBpdCdzIG5vdCBuZWVkZWQsIEknZCByYXRoZXIKPj4gbm90IHVzZSBp
dCwgYW5kIEkgZXZlbnR1YWxseSB3YW50IHRvIGdldCByaWQgb2YgaXQgZm9yICNEQiBhcyB3ZWxs
Lgo+IAo+IFRoZSAjVkMgaGFuZGxlciBuZWVkcyB0byBiZSBhYmxlIHRvIG5lc3QsIHRoZXJlIGlz
IG5vIHdheSBhcm91bmQgdGhhdAo+IGZvciB2YXJpb3VzIHJlYXNvbnMsIHRoZSB0d28gbW9zdCBp
bXBvcnRhbnQgb25lcyBhcmU6Cj4gCj4gICAgMS4gVGhlICNWQyAtPiBOTUkgLT4gI1ZDIGNhc2Uu
ICNWQ3MgY2FuIGhhcHBlbiBpbiB0aGUgTk1JCj4gICAgICAgaGFuZGxlciwgZm9yIGV4YW1wbGUg
KGJ1dCBub3QgZXhjbHVzaXZseSkgZm9yIFJEUE1DLgo+IAo+ICAgIDIuIEluIGNhc2Ugb2YgYW4g
ZXJyb3IgdGhlICNWQyBoYW5kbGVyIG5lZWRzIHRvIHByaW50IG91dCBlcnJvcgo+ICAgICAgIGlu
Zm9ybWF0aW9uIGJ5IGNhbGxpbmcgb25lIG9mIHRoZSBwcmludGsgd3JhcHBlcnMuIFRob3NlIHdp
bGwKPiAgICAgICBlbmQgdXAgZG9pbmcgSU8gdG8gc29tZSBjb25zb2xlL3NlcmlhbCBwb3J0L3do
YXRldmVyIHdoaWNoCj4gICAgICAgd2lsbCBhbHNvIGNhdXNlICNWQyBleGNlcHRpb25zIHRvIGVt
dWxhdGUgdGhlIGFjY2VzcyB0byB0aGUKPiAgICAgICBvdXRwdXQgZGV2aWNlcy4KPiAKPiBVc2lu
ZyBzaGlmdF9pc3QgaXMgcGVyZmVjdCBmb3IgdGhhdCwgdGhlIG9ubHkgcHJvYmxlbSBpcyB0aGUg
cmFjZQo+IGNvbmRpdGlvbiB3aXRoIHRoZSBOTUkgaGFuZGxlciwgYXMgc2hpZnRfaXN0IGRvZXMg
bm90IHdvcmsgd2VsbCB3aXRoCj4gZXhjZXB0aW9ucyB0aGF0IGNhbiBhbHNvIHRyaWdnZXIgd2l0
aGluIHRoZSBOTUkgaGFuZGxlci4gQnV0IEkgaGF2ZQo+IHRha2VuIGNhcmUgb2YgdGhhdCBmb3Ig
I1ZDLgo+IAoKSSBhc3N1bWUgdGhlIHJhY2UgeW91IG1lYW4gaXM6CgojVkMKSW1tZWRpYXRlIE5N
SSBiZWZvcmUgSVNUIGdldHMgc2hpZnRlZAojVkMKCkthYm9vbS4KCkhvdyBhcmUgeW91IGRlYWxp
bmcgd2l0aCB0aGlzPyAgVWx0aW1hdGVseSwgSSB0aGluayB0aGF0IE5NSSB3aWxsIG5lZWQgdG8g
dHVybiBvZmYgSVNUIGJlZm9yZSBlbmdhZ2luZyBpbiBhbnkgZnVubnkgYnVzaW5lc3MuIExldCBt
ZSBwb25kZXIgdGhpcyBhIGJpdC4KCj4gCj4gUmVnYXJkcywKPiAKPiAgICBKb2VyZwo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
