Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E016A664
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 13:47:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 646DA85D8D;
	Mon, 24 Feb 2020 12:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooxO49rd3Lzd; Mon, 24 Feb 2020 12:47:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC87985CA8;
	Mon, 24 Feb 2020 12:47:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A814BC0177;
	Mon, 24 Feb 2020 12:47:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29165C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A6AD20377
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQELpJerxa58
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 8776D20365
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:47:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v28so11705549edw.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 04:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6p1Rm/cgq3FqTcHGA+7QXUNsBMb6waSsaCWakkpOhMI=;
 b=A5k7B2yeMREJk4V/0+ln7mkEx9ndG+GryJgn7qN8lQZJcYUfs1D+JPsjLvR56RX+DK
 iBXtyo/SRWx0F5zpAdu+yjBImbCAjINAhNQu/007MyLV3iKr7kk7WR7ALu9K8TBJaH51
 5CaWZjxmLUNCqiCZGjU9j3BiwSTQK3ipYqNIN+ThumS6MQKRZOB2XP5aMMIE9o8WqRmS
 LliXiXeNidHS053+zkKmLGUO7+TcDnDZjAIkDkr2KbFylrTq5XZzq174TlPICOQ1zykr
 zCsKpUwklS4LdNqxJWUfgfJpMxeDrA0BppbAOiyfvPKGxsP0NhdhGpGUkesJy0cEap2a
 f+Lg==
X-Gm-Message-State: APjAAAX/0XDZNLEDtXE3fo0NzfoErS7TCzPUXuChibLNJtJA/6RJAiac
 eFbMeUvQczdrtiON/HTORXQ=
X-Google-Smtp-Source: APXvYqxOCnjuqHzZ8w9dppB5X8CKpWu3LAO4qx3F7JuCo/1tjWWY0qRzHXx7PYmPGsjZ1wOThemeng==
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr45290488ejs.319.1582548468870; 
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id n19sm944550edy.9.2020.02.24.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Date: Mon, 24 Feb 2020 13:47:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224124744.GA1949@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
Cc: Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
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

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTA6NDg6MzNBTSArMDEwMCwgSmlyaSBTbGFieSB3cm90
ZToKPiBPbiAxOS4gMDIuIDIwLCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+
IFRoZSBpb3JlYWRYKCkgaGVscGVycyBoYXZlIGluY29uc2lzdGVudCBpbnRlcmZhY2UuICBPbiBz
b21lIGFyY2hpdGVjdHVyZXMKPiA+IHZvaWQgKl9faW9tZW0gYWRkcmVzcyBhcmd1bWVudCBpcyBh
IHBvaW50ZXIgdG8gY29uc3QsIG9uIHNvbWUgbm90Lgo+ID4gCj4gPiBJbXBsZW1lbnRhdGlvbnMg
b2YgaW9yZWFkWCgpIGRvIG5vdCBtb2RpZnkgdGhlIG1lbW9yeSB1bmRlciB0aGUgYWRkcmVzcwo+
ID4gc28gdGhleSBjYW4gYmUgY29udmVydGVkIHRvIGEgImNvbnN0IiB2ZXJzaW9uIGZvciBjb25z
dC1zYWZldHkgYW5kCj4gPiBjb25zaXN0ZW5jeSBhbW9uZyBhcmNoaXRlY3R1cmVzLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4g
PiBBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMgfCAxMCArKysrKy0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYwo+ID4gaW5kZXggMmM5Y2VjOGI1M2Q5
Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoNWsvYWhiLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIu
Ywo+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRoX2FoYl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAo+ID4gIAlpZiAoYmNmZy0+ZGV2aWQgPj0g
QVI1S19TUkVWX0FSMjMxNV9SNikgewo+ID4gIAkJLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0
aW9uICovCj4gPiAtCQlyZWcgPSBpb3JlYWQzMigodm9pZCBfX2lvbWVtICopIEFSNUtfQVIyMzE1
X0FIQl9BUkJfQ1RMKTsKPiA+ICsJCXJlZyA9IGlvcmVhZDMyKChjb25zdCB2b2lkIF9faW9tZW0g
KikgQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+IAo+IFdoaWxlIEkgdW5kZXJzdGFuZCB3aHkg
dGhlIHBhcmFtZXRlciBvZiBpb3JlYWQzMiBzaG91bGQgYmUgY29uc3QsIEkKPiBkb24ndCBzZWUg
YSByZWFzb24gZm9yIHRoZXNlIGNhc3RzIG9uIHRoZSB1c2Vycycgc2lkZS4gV2hhdCBkb2VzIGl0
Cj4gYnJpbmcgZXhjZXB0IGxvbmdlciBjb2RlIHRvIHJlYWQ/CgpCZWNhdXNlIHRoZSBhcmd1bWVu
dCBpcyBhbiBpbnQ6Cgpkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmM6IEluIGZ1
bmN0aW9uIOKAmGF0aF9haGJfcHJvYmXigJk6CmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1
ay9haGIuYzoxNDE6MTg6IHdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhpb3JlYWQz
MuKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29u
dmVyc2lvbl0KICAgcmVnID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
