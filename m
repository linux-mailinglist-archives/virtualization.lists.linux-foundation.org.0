Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A7133D7A
	for <lists.virtualization@lfdr.de>; Wed,  8 Jan 2020 09:45:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 715C420499;
	Wed,  8 Jan 2020 08:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VboiFIvveHn; Wed,  8 Jan 2020 08:45:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 515CE2046B;
	Wed,  8 Jan 2020 08:45:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 255E8C0881;
	Wed,  8 Jan 2020 08:45:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 810E3C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 76225203E4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RkbPfVzXVc9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:44:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by silver.osuosl.org (Postfix) with ESMTPS id BA7C5203D8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:44:57 +0000 (UTC)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MOAFl-1j4IT12NbN-00OaO8 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 09:44:54 +0100
Received: by mail-qk1-f173.google.com with SMTP id c16so1936877qko.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 00:44:54 -0800 (PST)
X-Gm-Message-State: APjAAAUf/wdCiCCAJH+b6zojBtKtrsmj2uKSbflkph7p/Ptg1HeC21bW
 wKy5aR39Vug21CN3RHV6UTBFVjAmbZtEvifjxCU=
X-Google-Smtp-Source: APXvYqwBkJ8QmnIL+nEzdyW4cVb2dCgT1+bxTVHrv/QXRUdjO9mWLnIecKxCrEVE9XkgL278ZPmA2bqFRRwBDXNH4F8=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr3333439qka.286.1578473093254; 
 Wed, 08 Jan 2020 00:44:53 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 09:44:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Provags-ID: V03:K1:qmyVqmhaiio8t9E5iq4l/Oaa+Vm4Y1W+W2EZdOfs8D5NM9B0+NP
 yMqRvgin+ODX6YhL7KmltSY8Q7yxEBCv7knsH1SthFoqvUTc+YY8y7X22TbP/WHJYMPb+P0
 f1EGPpZ4huS3i64n4vN+BYUtLSBKvzuMCJhvS1MV0EjT2PwZ4LDmrgN4X2Ex9u7BFrGQLqg
 nV9xbTv2dl90R2ptpp/0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9qhQQ2LVuaw=:ImuOMzDsvQ4rOr1frbucVD
 4+mKpG//P9cZFFxsFWWji9kEKEEeuCs8fPNDi6hO0OGOb7gm7ylQcxRAe1qpJZy4CnP/6dIOv
 pkjo7UkZDqiYCgZHW9gotTWi0JvaUL758c7Qkz3/1VavMNHqDqMDd7UvGN8/1gxDkxRIAjUU8
 A7IT6fLypGLH4Ag+iRr9zPx9/rjHxeF/fOI0qjp2RIHnzOk0DpA2oJ8OQfcVnGBj9cqE6LATo
 PFr2L+/xQEhfhHlmQllANYJ59wb22VvUIKYTjyRe+wZYUwrYlA0ztAeQHU9eQ9GgUZvahMhnx
 uFngDMo6Ir23vAMB9QWzKyBoB4N9nrEwVGsQfmF8vKiYILLjD5ZhwOtzefVO4QYCVTBkMGzuk
 4bKHS/z2tcOQsOBClGbjhy3YGYLQZCOUEQwOFHm2SOyzJ0CeXrQzEYFPt2RQwWbj/r1mSpvCJ
 xqbkMZuzhV3bI7Nqaj6oSElvRiHxRBHNVeARJhRafSz0lORwOLsU0zZCexYm0jk6S+FSv0K4D
 WUfQ9NRlEdErxupZBkbc6oMXDq5WKHqmgEDu1Yxw+KyPvJasnLxtesZP+lBzaBDmeKP/ckoQW
 P8aGVUxAAtd03e321R1X95fRtduc31NgU7S9n0yreZpAtwHyo/nrEq8JqG+bOBa8TIOVvlIXd
 NaiDZ+RltrUjpstN1RQYBrOgHanTNYQjPy3oIVW/+J6t7tv1cAUytnHQRQxh4Cyx0Jd9MibU1
 4ruJY3Ds5RrEp/OuiADYqxf9Spl4yMpyWKXFOhmztY9IZR4+ZK6MFogJhttQE60bdCOjY1mA7
 0H1aFhLa8VsFFVouSlCzJvlWOF9DSj+PugI+E3N+03sDbNou+2Fx7STeU2e5X4Rr+BdE513Jc
 rWv5onNR702xeWkf3qGA==
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA5OjM2IEFNIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAYy1zLmZyPiB3cm90ZToKPiBMZSAwOC8wMS8yMDIwIMOgIDA5OjE4LCBLcnp5c3p0
b2YgS296bG93c2tpIGEgw6ljcml0IDoKPiA+IE9uIFdlZCwgOCBKYW4gMjAyMCBhdCAwOToxMywg
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiBJJ2xs
IGFkZCB0byB0aGlzIG9uZSBhbHNvIGNoYW5nZXMgdG8gaW9yZWFkWF9yZXAoKSBhbmQgYWRkIGFu
b3RoZXIKPiA+IHBhdGNoIGZvciB2b2xhdGlsZSBmb3IgcmVhZHMgYW5kIHdyaXRlcy4gSSBndWVz
cyB5b3VyIHJldmlldyB3aWxsIGJlCj4gPiBhcHByZWNpYXRlZCBvbmNlIG1vcmUgYmVjYXVzZSBv
ZiBpb3JlYWRYX3JlcCgpCj4gPgo+Cj4gdm9sYXRpbGUgc2hvdWxkIHJlYWxseSBvbmx5IGJlIHVz
ZWQgd2hlcmUgZGVlbWVkIG5lY2Vzc2FyeToKPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvdm9sYXRpbGUtY29uc2lkZXJlZC1oYXJtZnVsLmh0bWwKPgo+
IEl0IGlzIHNhaWQ6ICIgLi4uICBhY2Nlc3NvciBmdW5jdGlvbnMgbWlnaHQgdXNlIHZvbGF0aWxl
IG9uCj4gYXJjaGl0ZWN0dXJlcyB3aGVyZSBkaXJlY3QgSS9PIG1lbW9yeSBhY2Nlc3MgZG9lcyB3
b3JrLiBFc3NlbnRpYWxseSwKPiBlYWNoIGFjY2Vzc29yIGNhbGwgYmVjb21lcyBhIGxpdHRsZSBj
cml0aWNhbCBzZWN0aW9uIG9uIGl0cyBvd24gYW5kCj4gZW5zdXJlcyB0aGF0IHRoZSBhY2Nlc3Mg
aGFwcGVucyBhcyBleHBlY3RlZCBieSB0aGUgcHJvZ3JhbW1lci4iCgpUaGUgSS9PIGFjY2Vzc29y
cyBhcmUgb25lIG9mIHRoZSBmZXcgcGxhY2VzIGluIHdoaWNoICd2b2xhdGlsZScgZ2VuZXJhbGx5
Cm1ha2VzIHNlbnNlLCBhdCBsZWFzdCBmb3IgdGhlIGltcGxlbWVudGF0aW9ucyB0aGF0IGRvIGEg
cGxhaW4gcG9pbnRlcgpkZXJlZmVyZW5jZSAocHJvYmFibHkgbm9uZSBvZiB0aGUgb25lcyBpbiBx
dWVzdGlvbiBoZXJlKS4KCkluIGNhc2Ugb2YgcmVhZGwvd3JpdGVsLCB0aGlzIGlzIHdoYXQgd2Ug
ZG8gaW4gYXNtLWdlbmVyaWM6CgpzdGF0aWMgaW5saW5lIHUzMiBfX3Jhd19yZWFkbChjb25zdCB2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCnsKICAgICAgICByZXR1cm4gKihjb25zdCB2b2xh
dGlsZSB1MzIgX19mb3JjZSAqKWFkZHI7Cn0KClRoZSBfX2ZvcmNlLWNhc3QgdGhhdCByZW1vdmVz
IHRoZSBfX2lvbWVtIGhlcmUgYWxzbyBtZWFucyB0aGF0CnRoZSAndm9sYXRpbGUnIGtleXdvcmQg
Y291bGQgYmUgZHJvcHBlZCBmcm9tIHRoZSBhcmd1bWVudCBsaXN0LAphcyBpdCBoYXMgbm8gcmVh
bCBlZmZlY3QgYW55IG1vcmUsIGJ1dCB0aGVuIHRoZXJlIGFyZSBhIGZldyBkcml2ZXJzCnRoYXQg
bWFyayB0aGVpciBpb21lbSBwb2ludGVycyBhcyBlaXRoZXIgJ3ZvbGF0aWxlIHZvaWQgX19pb21l
bSonIG9yCih3b3JzZSkgJ3ZvbGF0aWxlIHZvaWQgKicsIHNvIHdlIGtlZXAgaXQgaW4gdGhlIGFy
Z3VtZW50IGxpc3QgdG8gbm90CmFkZCB3YXJuaW5ncyBmb3IgdGhvc2UgZHJpdmVycy4KCkl0IG1h
eSBiZSB0aW1lIHRvIGNoYW5nZSB0aGVzZSBkcml2ZXJzIHRvIG5vdCB1c2Ugdm9sYXRpbGUgZm9y
IF9faW9tZW0KcG9pbnRlcnMsIGJ1dCB0aGF0IHNlZW1zIG91dCBvZiBzY29wZSBmb3Igd2hhdCBL
cnp5c3p0b2YgaXMgdHJ5aW5nCnRvIGRvLiBJZGVhbGx5IHdlIHdvdWxkIGJlIGNvbnNpc3RlbnQg
aGVyZSB0aG91Z2gsIGVpdGhlciB1c2luZyB2b2xhdGlsZQphbGwgdGhlIHRpbWUgb3IgbmV2ZXIu
CgogICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
