Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3816A683
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 13:54:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABBA88618E;
	Mon, 24 Feb 2020 12:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-wDjuLJPdor; Mon, 24 Feb 2020 12:54:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E35486196;
	Mon, 24 Feb 2020 12:54:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1F01C0177;
	Mon, 24 Feb 2020 12:54:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2CEFC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D23B6203D7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJ4Z24goVFqw
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:54:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 04FC3204DE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:54:12 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w6so8601913otk.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 04:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KuIMkn3CNjUmXT9na5O6u952ZSxUT8pEly8T96UQHaU=;
 b=En0XQ7guq2EfSYYqQPf5DXgDye+GO/DeSYCgy8+p03xrGSW2yhaR6750n6K4KFw/XR
 TJjHiAD/SNyJB2XUsOExsGemn8Tdqiun6vwuLsCRtevA5SF+yt7JlOzozjG27X8RhWxQ
 M7XivUyTo5MywkVRNb7bfqYnvaHdv0hEGimmNWWVmm1U3ryTlbBf/sVlZ2UeXUN/EaRF
 Eldmr7yTfn2pZGPwXofgL/QWLLE9Vq46hbQnvVjw13W5cKUaoF0ztqXXtUG5HgTvyYmL
 YB08Yz5TgWb0Ae7HJclJ6to/ODpPEMCq3vYvEeiVsJP3YHeDxLdbp6nWJO1TqK5TgcXv
 2uhw==
X-Gm-Message-State: APjAAAXW8SEbi6uO0RmPhOWFTMjqlcIbOWCdx0KVGC5fq67jhmAVV/cl
 zcgD6m8miymM84SqiT8ciR86MMuGFbmHWqAwuMQ=
X-Google-Smtp-Source: APXvYqwtZk2+zO66egcnUYHRtozVqcTMGUrrNpS9RZJQahGOv8qXCcCp9UcRypG9zsmrMsbFU1zCpBady1p1pO44v4k=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr40460889otm.297.1582548851139; 
 Mon, 24 Feb 2020 04:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com> <20200224124744.GA1949@pi3>
In-Reply-To: <20200224124744.GA1949@pi3>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2020 13:54:00 +0100
Message-ID: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
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

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTo0NyBQTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgRmViIDIwLCAyMDIw
IGF0IDEwOjQ4OjMzQU0gKzAxMDAsIEppcmkgU2xhYnkgd3JvdGU6Cj4gPiBPbiAxOS4gMDIuIDIw
LCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+ID4gVGhlIGlvcmVhZFgoKSBo
ZWxwZXJzIGhhdmUgaW5jb25zaXN0ZW50IGludGVyZmFjZS4gIE9uIHNvbWUgYXJjaGl0ZWN0dXJl
cwo+ID4gPiB2b2lkICpfX2lvbWVtIGFkZHJlc3MgYXJndW1lbnQgaXMgYSBwb2ludGVyIHRvIGNv
bnN0LCBvbiBzb21lIG5vdC4KPiA+ID4KPiA+ID4gSW1wbGVtZW50YXRpb25zIG9mIGlvcmVhZFgo
KSBkbyBub3QgbW9kaWZ5IHRoZSBtZW1vcnkgdW5kZXIgdGhlIGFkZHJlc3MKPiA+ID4gc28gdGhl
eSBjYW4gYmUgY29udmVydGVkIHRvIGEgImNvbnN0IiB2ZXJzaW9uIGZvciBjb25zdC1zYWZldHkg
YW5kCj4gPiA+IGNvbnNpc3RlbmN5IGFtb25nIGFyY2hpdGVjdHVyZXMuCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+ID4g
QWNrZWQtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyB8IDEwICsrKysrLS0tLS0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhi
LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMKPiA+ID4gaW5kZXggMmM5
Y2VjOGI1M2Q5Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGg1ay9haGIuYwo+ID4gPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoNWsvYWhiLmMKPiA+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRo
X2FoYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPgo+ID4gPiAgICAg
aWYgKGJjZmctPmRldmlkID49IEFSNUtfU1JFVl9BUjIzMTVfUjYpIHsKPiA+ID4gICAgICAgICAg
ICAgLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0aW9uICovCj4gPiA+IC0gICAgICAgICAgIHJl
ZyA9IGlvcmVhZDMyKCh2b2lkIF9faW9tZW0gKikgQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+
ID4gPiArICAgICAgICAgICByZWcgPSBpb3JlYWQzMigoY29uc3Qgdm9pZCBfX2lvbWVtICopIEFS
NUtfQVIyMzE1X0FIQl9BUkJfQ1RMKTsKPiA+Cj4gPiBXaGlsZSBJIHVuZGVyc3RhbmQgd2h5IHRo
ZSBwYXJhbWV0ZXIgb2YgaW9yZWFkMzIgc2hvdWxkIGJlIGNvbnN0LCBJCj4gPiBkb24ndCBzZWUg
YSByZWFzb24gZm9yIHRoZXNlIGNhc3RzIG9uIHRoZSB1c2Vycycgc2lkZS4gV2hhdCBkb2VzIGl0
Cj4gPiBicmluZyBleGNlcHQgbG9uZ2VyIGNvZGUgdG8gcmVhZD8KPgo+IEJlY2F1c2UgdGhlIGFy
Z3VtZW50IGlzIGFuIGludDoKPgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIu
YzogSW4gZnVuY3Rpb24g4oCYYXRoX2FoYl9wcm9iZeKAmToKPiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoNWsvYWhiLmM6MTQxOjE4OiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2Yg
4oCYaW9yZWFkMzLigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3Qg
Wy1XaW50LWNvbnZlcnNpb25dCj4gICAgcmVnID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FS
Ql9DVEwpOwoKVGhhdCdzIGFuIGFyZ3VtZW50IGZvciBrZWVwaW5nIHRoZSBjYXN0IHRvICJ2b2lk
IF9faW9tZW0gKiIsIG5vdCBmb3IKYWRkaW5nIHRoZSAiY29uc3QiLCByaWdodD8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
