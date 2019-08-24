Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8B9BC70
	for <lists.virtualization@lfdr.de>; Sat, 24 Aug 2019 09:57:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6924CA4;
	Sat, 24 Aug 2019 07:57:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D3D24C86
	for <virtualization@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 07:57:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 96AA667F
	for <virtualization@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 07:57:11 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s21so25614105ioa.1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 00:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Rt7wtYCc1s5tor1o81jIoZmh+z8hgaSPweyus4OLaDI=;
	b=K3z+flYVSNNSWoTBFmevj6fYPEM2G+divlFtL3oFGJ/e/x/iInhDr1dHK6vOFA/Sbp
	0UBZ0ILyiMLYwgPhEtNbPrCfbqGmZtE/iabl81cCpUXQwu/WVEpKa5tCim0w1eCIh71t
	eInx/aknxqQIs4gIxsdejGNRIx8xP+U2vTrq8ZHY1WRqCjxz80WNyH+rIwQ2mT6JfE1B
	QwqIwtiPieUU8kHxEfuWEcHR8GIRvzO2XbMzcLUUBoaBKhzkgm+6/ek9kkwQndKDRlwN
	Bo6V5oJZr/cP6fVAv0g7HenkS6s1hcn7PjRTIxgVGyzPH3mpyl52vEoa/RUroG5wsa33
	XzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Rt7wtYCc1s5tor1o81jIoZmh+z8hgaSPweyus4OLaDI=;
	b=M7CRwDkXmCdFu95acO5VxxgkQ4H/nrkL+3LMn2ECsz0thFhKpJfBQDfTxqh0MDa5Xf
	9fcFGUbQf8cu6MjvcTRe3RUK/vjv6l4O5pz7eY5UiUyeTz4PHfFFb87DmclfDfJfrmbi
	dlPfYXRS9jc6R0hDGr38u7GD4BcAftGD1fxXDiNW2V4pLDzmm32KDaRIiEl3X9ziIHE+
	ouZhe2razBjBUqYN07meqLPDbmlB/FNfZUCY95LrVK1KB3h6zOeGA5c0I43TTFLkaX8f
	vohvW/mkE8Fmd1fE4VGP3F6IP3KS0kRd32G0oxazdbhle9dAc7A+ZYhQVtB+1irxouFQ
	tFqw==
X-Gm-Message-State: APjAAAWeHmlPMBYskKnu+b936r4XAJ4xZzOf/bSkdwmeqjJTzNkFBw/S
	ZBapO0yDoffnshJfzoUXoGg+e98Kp1EL6V2GgPJnQQ==
X-Google-Smtp-Source: APXvYqwxcXr8xhaFGFkwJobfl5gf6+4v9QSf+/e/XxuJihI8hsXlCsjVuqNrS0RHDZAcIleIWvUKgloQNh3YdFkKQX8=
X-Received: by 2002:a6b:b8c4:: with SMTP id
	i187mr12749931iof.102.1566633430565; 
	Sat, 24 Aug 2019 00:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190815110944.3579-1-murphyt7@tcd.ie>
	<20190815110944.3579-2-murphyt7@tcd.ie>
	<20190820094143.GA24154@infradead.org>
In-Reply-To: <20190820094143.GA24154@infradead.org>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Sat, 24 Aug 2019 08:56:59 +0100
Message-ID: <CALQxJussiGDzWFT1xhko6no5jZNOezWCFuJQUCr4XwH4NHri3Q@mail.gmail.com>
Subject: Re: [PATCH V5 1/5] iommu/amd: Remove unnecessary locking from AMD
	iommu driver
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-s390@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

PkkgaGF2ZSB0byBhZG1pdCBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIGNvbmN1cnJlbmN5
IGlzc3VlcyBoZXJlLCBidXQgbmVpdGhlciBkbyBJIHVuZGVyc3RhbmQgd2hhdCB0aGUgbXV0ZXgg
eW91IHJlbW92ZWQgbWlnaHQgaGF2ZSBoZWxwZWQgdG8gc3RhcnQgd2l0aC4KCkVhY2ggcmFuZ2Ug
aW4gdGhlIHBhZ2UgdGFibGVzIGlzIHByb3RlY3RlZCBieSB0aGUgSU8gdmlydHVhbCBhZGRyZXNz
CmFsbG9jYXRvci4gVGhlIGlvbW11IGRyaXZlciBhbGxvY2F0ZXMgYW4gSU9WQSByYW5nZSB1c2lu
ZyBsb2NrcyBiZWZvcmUKaXQgd3JpdGVzIHRvIGEgcGFnZSB0YWJsZSByYW5nZS4gVGhlIElPVkEg
YWxsb2NhdG9yIGFjdHMgbGlrZSBhIGxvY2sKb24gYSBzcGVjaWZpYyByYW5nZSBvZiB0aGUgcGFn
ZSB0YWJsZXMuIFNvIHdlIGNhbiBoYW5kbGUgbW9zdCBvZiB0aGUKY29uY3VycmVuY3kgaXNzdWVz
IGluIHRoZSBJT1ZBIGFsbG9jYXRvciBhbmQgYXZvaWQgbG9ja2luZyB3aGlsZQp3cml0aW5nIHRv
IGEgcmFuZ2UgaW4gdGhlIHBhZ2UgdGFibGVzLgoKSG93ZXZlciBiZWNhdXNlIHdlIGhhdmUgbXVs
dGlwbGUgbGV2ZWxzIG9mIHBhZ2VzIHdlIG1pZ2h0IGhhdmUgdG8KYWxsb2NhdGUgYSBtaWRkbGUg
cGFnZSAoYSBQTUQpIHdoaWNoIGNvdmVycyBtb3JlIHRoYW4gdGhlIElPVkEgcmFuZ2UKd2UgaGF2
ZSBhbGxvY2F0ZWQuClRvIHNvbHZlIHRoaXMgd2UgY291bGQgdXNlIGxvY2tzOgoKLy9wc2V1ZG8g
Y29kZQpsb2NrX3BhZ2VfdGFibGUoKQppZiAod2UgbmVlZCB0byBhbGxvY2F0ZSBtaWRkbGUgcGFn
ZXMpIHsKIC8vYWxsb2NhdGUgdGhlIHBhZ2UKIC8vc2V0IHRoZSBQTUQgdmFsdWUKfQp1bmxvY2tf
cGFnZV90YWJsZSgpCgpidXQgd2UgY2FuIGFjdHVhbGx5IGF2b2lkIGhhdmluZyBhbnkgbG9ja2lu
ZyBieSBkb2luZyB0aGUgZm9sbG93aW5nOgoKLy9wc2V1ZG8gY29kZQppZiAod2UgbmVlZCB0byBh
bGxvY2F0ZSBtaWRkbGUgcGFnZXMpIHsKIC8vYWxsb2NhdGUgdGhlIHBhZ2UKIC8vY21weGNoZzY0
IHRvIHNldCB0aGUgUE1EIGlmIGl0IHdhc24ndCBhbHJlYWR5IHNldCBzaW5jZSB3ZSBsYXN0IGNo
ZWNrZWQKIGlmICh0aGUgUE1EIHdhcyBzZXQgd2hpbGUgc2luY2Ugd2UgbGFzdCBjaGVja2VkKQog
ICAvL2ZyZWUgdGhlIHBhZ2Ugd2UganVzdCBhbGxvY2F0ZWQKfQoKSW4gdGhpcyBjYXNlIHdlIGNh
biBlbmQgdXAgZG9pbmcgYSBwb2ludGxlc3MgcGFnZSBhbGxvY2F0ZSBhbmQgZnJlZQpidXQgaXQn
cyB3b3J0aCBpdCB0byBhdm9pZCB1c2luZyBsb2NrcwoKWW91IGNhbiBzZWUgdGhpcyBpbiB0aGUg
aW50ZWwgaW9tbXUgY29kZSBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi85MTQwZDhiZGQ0YzVhMDRhYmUxODFiYjMwMDM3ODM1NWQ1Njk5MGE0L2RyaXZlcnMvaW9t
bXUvaW50ZWwtaW9tbXUuYyNMOTA0Cgo+d2hhdCB0aGUgbXV0ZXggeW91IHJlbW92ZWQgbWlnaHQg
aGF2ZSBoZWxwZWQgdG8gc3RhcnQgd2l0aC4KVGhlIG11dGV4IEkgcmVtb3ZlZCBpcyBhcmd1YWJs
eSBjb21wbGV0ZWx5IHVzZWxlc3MuCgpJbiB0aGUgZG1hIG9wcyBwYXRoIHdlIGhhbmRsZSB0aGUg
SU9WQSBhbGxvY2F0aW9ucyBpbiB0aGUgZHJpdmVyIHNvIHdlCmNhbiBiZSBzdXJlIGEgY2VydGFp
biByYW5nZSBpcyBwcm90ZWN0ZWQgYnkgdGhlIElPVkEgYWxsb2NhdG9yLgoKQmVjYXVzZSB0aGUg
aW9tbXUgb3BzIHBhdGggZG9lc24ndCBoYW5kbGUgdGhlIElPVkEgYWxsb2NhdGlvbnMgaXQKc2Vl
bXMgcmVhc29uYWJsZSB0byBsb2NrIHRoZSBwYWdlIHRhYmxlcyB0byBhdm9pZCB0d28gd3JpdGVy
cyB3cml0aW5nCnRvIHRoZSBzYW1lIHJhbmdlIGF0IHRoZSBzYW1lIHRpbWUuIFdpdGhvdXQgdGhl
IGxvY2sgaXQncyBjb21wbGV0ZQpjaGFvcyBhbmQgYWxsIHdyaXRlcnMgY2FuIGJlIHdyaXRpbmcg
dG8gdGhlIHNhbWUgcmFuZ2UgYXQgdGhlIHNhbWUKdGltZSByZXN1bHRpbmcgaW4gY29tcGxldGUg
Z2FyYmFnZS4KQlVUIHRoZSBsb2NraW5nIGRvZXNuJ3QgYWN0dWFsbHkgbWFrZSBhbnkgcmVhbCBk
aWZmZXJlbmNlLiBFdmVuIHdpdGgKbG9ja2luZyB3ZSBzdGlsbCBoYXZlIGEgcmFjZSBjb25kaXRp
b24gaWYgdHdvIHdyaXRlcnMgd2FudCB0byB3cml0ZSB0bwp0aGUgc2FtZSByYW5nZSBhdCB0aGUg
c2FtZSB0aW1lLCB0aGUgcmFjZSBpcyBqdXN0IHdob2V2ZXIgZ2V0cyB0aGUKbG9jayBmaXJzdCwg
d2Ugc3RpbGwgY2FuJ3QgYmUgc3VyZSB3aGF0IHRoZSByZXN1bHQgd2lsbCBiZS4gU28gdGhlCnJl
c3VsdCBpcyBzdGlsbCBnYXJiYWdlLCBqdXN0IHNsaWdodGx5IG1vcmUgdXNhYmxlIGdhcmJhZ2Ug
YmVjYXVzZSBhdApsZWFzdCB0aGUgcmFuZ2UgaXMgY29ycmVjdCBmb3Igb25lIHdyaXRlci4KSXQg
anVzdCBtYWtlcyBubyBzZW5zZSB0byBldmVyIGhhdmUgdHdvIHdyaXRlcnMgd3JpdGluZyB0byB0
aGUgc2FtZQpyYW5nZSBhbmQgYWRkaW5nIGEgbG9jayBkb2Vzbid0IGZpeCB0aGF0LgpBbHJlYWR5
IHRoZSBJbnRlbCBpb21tdSBvcHMgcGF0aCBkb2Vzbid0IHVzZSBsb2NrcyBmb3IgaXQncyBwYWdl
IHRhYmxlCnNvIHRoaXMgaXNuJ3QgYSBuZXcgaWRlYSBJJ20ganVzdCBkb2luZyB0aGUgc2FtZSBm
b3IgdGhlIEFNRCBpb21tdQpkcml2ZXIKCkRvZXMgYWxsIHRoYXQgbWFrZSBzZW5zZT8KCk9uIFR1
ZSwgMjAgQXVnIDIwMTkgYXQgMTA6NDEsIENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFk
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMjowOTozOVBNICswMTAw
LCBUb20gTXVycGh5IHdyb3RlOgo+ID4gV2UgY2FuIHJlbW92ZSB0aGUgbXV0ZXggbG9jayBmcm9t
IGFtZF9pb21tdV9tYXAgYW5kIGFtZF9pb21tdV91bm1hcC4KPiA+IGlvbW11X21hcCBkb2VzbuKA
mXQgbG9jayB3aGlsZSBtYXBwaW5nIGFuZCBzbyBubyB0d28gY2FsbHMgc2hvdWxkIHRvdWNoCj4g
PiB0aGUgc2FtZSBpb3ZhIHJhbmdlLiBUaGUgQU1EIGRyaXZlciBhbHJlYWR5IGhhbmRsZXMgdGhl
IHBhZ2UgdGFibGUgcGFnZQo+ID4gYWxsb2NhdGlvbnMgd2l0aG91dCBsb2NrcyBzbyB3ZSBjYW4g
c2FmZWx5IHJlbW92ZSB0aGUgbG9ja3MuCj4KPiBJJ3ZlIGJlZW4gbG9va2luZyBvdmVyIHRoZSBj
b2RlIGFuZCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdGhlCj4gc3luY2hyb25pemF0aW9uIHdv
cmtzLiAgSSBndWVzIHdlIHRoZSBjbXB4Y2hnNjQgaW4gZnJlZV9jbGVhcl9wdGUKPiBpcyB0aGUg
aW1wb3J0YW50IHBvaW50IGhlcmU/ICBJIGhhdmUgdG8gYWRtaXQgSSBkb24ndCBmdWxseSB1bmRl
cnN0YW5kCj4gdGhlIGNvbmN1cnJlbmN5IGlzc3VlcyBoZXJlLCBidXQgbmVpdGhlciBkbyBJIHVu
ZGVyc3RhbmQgd2hhdCB0aGUKPiBtdXRleCB5b3UgcmVtb3ZlZCBtaWdodCBoYXZlIGhlbHBlZCB0
byBzdGFydCB3aXRoLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
