Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4A133D66
	for <lists.virtualization@lfdr.de>; Wed,  8 Jan 2020 09:43:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A93A85BE4;
	Wed,  8 Jan 2020 08:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVdkohmWa5fi; Wed,  8 Jan 2020 08:43:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE5C485CFE;
	Wed,  8 Jan 2020 08:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9338BC1D85;
	Wed,  8 Jan 2020 08:43:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5875C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D168F8656A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2xULg0RI3d6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A0978650D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:43:16 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r9so2780744otp.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 00:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7cWBGOss6IZmXIImkX09JkN+lqirutcjNONiaHMIXk4=;
 b=Q+QryAXQv1pPQcB9lwQ6YDx/R4rdspiJ5qJk5VBjNxa51ENwYEQNzQdXnr00ReRuiR
 XBCPZMdVEedcusuWiGmlva0dmlXCuMc/jnpGG8BPVMfqBGHkGE1yvtjqIvHGp0A+c2cQ
 3X4hFNa8ssdJqUVEQ8Mvq/bynxa+wMLslLvnSOSvbN4ezsvTVcjhYt2Z90/E1YXhzUZv
 kYOlU7BzzxPdMkvNCGprD1Tkwq+lX6BcPfBSn85lmeTVqKr9KxK/1bW/A/njkEcifclj
 DMvfjPHR517ZPTTtI/8XNMAix94XUs/3MebwJht0KRZv48UN2RzISOplwPpEv1w0qMSH
 RrjA==
X-Gm-Message-State: APjAAAVS+GdJaBejfGjNje9WNcJKrcLndf0j7xdVLj1EEHGFUWLPdWHI
 vCgyVkX5Rz7VtkKHDX8CziCvigVfXkO3+pTjWxY=
X-Google-Smtp-Source: APXvYqyLwchytFfBRcGzmYLq5q4p5hvwH1AjnwV9nNk5cX7+q/Njb59ahRoMRaX1Y0RAyipVtDWx7V8ZzLixl6z6dho=
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr3302303otq.145.1578472995351; 
 Wed, 08 Jan 2020 00:43:15 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:43:04 +0100
Message-ID: <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
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

SGkgQ2hyaXN0b3BoZSwKCk9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOTozNSBBTSBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gd3JvdGU6Cj4gTGUgMDgvMDEvMjAyMCDD
oCAwOToxOCwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdCA6Cj4gPiBPbiBXZWQsIDggSmFu
IDIwMjAgYXQgMDk6MTMsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+ID4+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOTowNyBBTSBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+Pj4gT24gVHVlLCBKYW4gNywg
MjAyMCBhdCA1OjUzIFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPj4+PiBUaGUgaW9yZWFkOC8xNi8zMigpIGFuZCBvdGhlcnMgaGF2ZSBpbmNvbnNpc3Rl
bnQgaW50ZXJmYWNlIGFtb25nIHRoZQo+ID4+Pj4gYXJjaGl0ZWN0dXJlczogc29tZSB0YWtpbmcg
YWRkcmVzcyBhcyBjb25zdCwgc29tZSBub3QuCj4gPj4+Pgo+ID4+Pj4gSXQgc2VlbXMgdGhlcmUg
aXMgbm90aGluZyByZWFsbHkgc3RvcHBpbmcgYWxsIG9mIHRoZW0gdG8gdGFrZQo+ID4+Pj4gcG9p
bnRlciB0byBjb25zdC4KPiA+Pj4KPiA+Pj4gU2hvdWxkbid0IGFsbCBvZiB0aGVtIHRha2UgY29u
c3Qgdm9sYXRpbGUgX19pb21lbSBwb2ludGVycz8KPiA+Pj4gSXQgc2VlbXMgdGhlICJ2b2xhdGls
ZSIgaXMgbWlzc2luZyBmcm9tIGFsbCBidXQgdGhlIGltcGxlbWVudGF0aW9ucyBpbgo+ID4+PiBp
bmNsdWRlL2FzbS1nZW5lcmljL2lvLmguCj4gPj4KPiA+PiBBcyBteSAidm9sYXRpbGUiIGNvbW1l
bnQgYXBwbGllcyB0byBpb3dyaXRlKigpLCB0b28sIHByb2JhYmx5IHRoYXQgc2hvdWxkIGJlCj4g
Pj4gZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+ID4+Cj4gPj4gSGVuY2Ugd2l0aCBwYXRjaGVz
IDEtNSBzcXVhc2hlZCwgYW5kIGZvciBwYXRjaGVzIDExLTEzOgo+ID4+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4KPiA+IEknbGwg
YWRkIHRvIHRoaXMgb25lIGFsc28gY2hhbmdlcyB0byBpb3JlYWRYX3JlcCgpIGFuZCBhZGQgYW5v
dGhlcgo+ID4gcGF0Y2ggZm9yIHZvbGF0aWxlIGZvciByZWFkcyBhbmQgd3JpdGVzLiBJIGd1ZXNz
IHlvdXIgcmV2aWV3IHdpbGwgYmUKPiA+IGFwcHJlY2lhdGVkIG9uY2UgbW9yZSBiZWNhdXNlIG9m
IGlvcmVhZFhfcmVwKCkKPgo+IHZvbGF0aWxlIHNob3VsZCByZWFsbHkgb25seSBiZSB1c2VkIHdo
ZXJlIGRlZW1lZCBuZWNlc3Nhcnk6Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L2xhdGVzdC9wcm9jZXNzL3ZvbGF0aWxlLWNvbnNpZGVyZWQtaGFybWZ1bC5odG1sCj4KPiBJdCBp
cyBzYWlkOiAiIC4uLiAgYWNjZXNzb3IgZnVuY3Rpb25zIG1pZ2h0IHVzZSB2b2xhdGlsZSBvbgo+
IGFyY2hpdGVjdHVyZXMgd2hlcmUgZGlyZWN0IEkvTyBtZW1vcnkgYWNjZXNzIGRvZXMgd29yay4g
RXNzZW50aWFsbHksCj4gZWFjaCBhY2Nlc3NvciBjYWxsIGJlY29tZXMgYSBsaXR0bGUgY3JpdGlj
YWwgc2VjdGlvbiBvbiBpdHMgb3duIGFuZAo+IGVuc3VyZXMgdGhhdCB0aGUgYWNjZXNzIGhhcHBl
bnMgYXMgZXhwZWN0ZWQgYnkgdGhlIHByb2dyYW1tZXIuIgoKVGhhdCBpcyBleGFjdGx5IHRoZSB1
c2UgY2FzZSBoZXJlOiBhbGwgYWJvdmUgYXJlIGFjY2Vzc29yIGZ1bmN0aW9ucy4KCldoeSB3b3Vs
ZCBpb3JlYWRYKCkgbm90IG5lZWQgdm9sYXRpbGUsIHdoaWxlIHJlYWRZKCkgZG9lcz8KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
