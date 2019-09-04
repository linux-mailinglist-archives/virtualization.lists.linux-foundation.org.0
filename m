Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF0A806F
	for <lists.virtualization@lfdr.de>; Wed,  4 Sep 2019 12:37:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7DE8E143D;
	Wed,  4 Sep 2019 10:37:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 567CA116A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 10:37:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E98A2709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 10:37:21 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5853F1E2E6
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 10:37:21 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id y67so22560291qkc.14
	for <virtualization@lists.linux-foundation.org>;
	Wed, 04 Sep 2019 03:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=3U+t4+2zJKbuXz99iZtKQog9/vhKyWkpmsxRg7JGQDE=;
	b=ImFxPZcLPL+05BvzQoxj3h4kx9RUt/TGne1FLS3HgAd3+3O3qEBqfd7QHwdJ2xVJa/
	AfvpnmHJOt8FO6DzVDwEojvFAPPagmFIzZvWadpquU1bNsIlKnVNmdZH7H8GNL1BY5Uf
	koQSfp5Av7Bx+Am85nyAiTnTXt2kOQebw1F7UpRvnWqMNp8IoIWoRrG7rUWot3BFxDjb
	PhWgDP1sra8eqNi3NfYysofjRp6nX6F60ZtDC7nkHRBF8vh/1Y3eka4ywyyta51lvTAi
	WZal2fCJ9Ei/j5bu1ESbzx3NuiT+2su5yY3pTBCMMSB41YgI/wEsIbyzKn2tFOo5nOld
	/WSw==
X-Gm-Message-State: APjAAAV66PTcqaw+/lA5/mfpnNR95AmGz3GuYD1A1VeaNEmGCkRmD+Y/
	eaFSluISHXbRZIysEtRm0e0Nku8lcb/ouXEZW628IGKE1eK9C1KyvGYPLbgf2GxA1ZXR8WD4669
	TiTrDi1Uwb9uEFWFfbKJrHspA+qmRPyqSE1EfEb0IfQ==
X-Received: by 2002:a37:4a88:: with SMTP id
	x130mr39287230qka.501.1567593440685; 
	Wed, 04 Sep 2019 03:37:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzddU8SouAdok0NmEiOpSZh4ZsJm0UIpWp7Qa5JYWIOzRtEyne94p1wCOaQIiKI9ZMVFqLQg==
X-Received: by 2002:a37:4a88:: with SMTP id
	x130mr39287214qka.501.1567593440533; 
	Wed, 04 Sep 2019 03:37:20 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id e7sm4085888qto.43.2019.09.04.03.37.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 03:37:19 -0700 (PDT)
Date: Wed, 4 Sep 2019 06:37:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH] mm/balloon_compaction: suppress allocation warnings
Message-ID: <20190904063703-mutt-send-email-mst@kernel.org>
References: <20190820091646.29642-1-namit@vmware.com>
	<ba01ec8c-19c3-847c-a315-2f70f4b1fe31@redhat.com>
	<5BBC6CB3-2DCD-4A95-90C9-7C23482F9B32@vmware.com>
	<85c72875-278f-fbab-69c9-92dc1873d407@redhat.com>
	<FC42B62F-167F-4D7D-ADC5-926B36347E82@vmware.com>
	<2aa52636-4ca7-0d47-c5bf-42408af3ea0f@redhat.com>
	<D4105FF4-5DF3-4DB5-9325-855B63CD9AAD@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D4105FF4-5DF3-4DB5-9325-855B63CD9AAD@vmware.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDc6NDQ6MzNQTSArMDAwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiA+IE9uIEF1ZyAyMSwgMjAxOSwgYXQgMTI6MTMgUE0sIERhdmlkIEhpbGRlbmJyYW5kIDxk
YXZpZEByZWRoYXQuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gMjEuMDguMTkgMTg6MzQsIE5hZGF2
IEFtaXQgd3JvdGU6Cj4gPj4+IE9uIEF1ZyAyMSwgMjAxOSwgYXQgOToyOSBBTSwgRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+PiAKPiA+Pj4gT24gMjEuMDgu
MTkgMTg6MjMsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gPj4+Pj4gT24gQXVnIDIxLCAyMDE5LCBhdCA5
OjA1IEFNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4+
Pj4gCj4gPj4+Pj4gT24gMjAuMDguMTkgMTE6MTYsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gPj4+Pj4+
IFRoZXJlIGlzIG5vIHJlYXNvbiB0byBwcmludCB3YXJuaW5ncyB3aGVuIGJhbGxvb24gcGFnZSBh
bGxvY2F0aW9uIGZhaWxzLAo+ID4+Pj4+PiBhcyB0aGV5IGFyZSBleHBlY3RlZCBhbmQgY2FuIGJl
IGhhbmRsZWQgZ3JhY2VmdWxseS4gIFNpbmNlIFZNd2FyZQo+ID4+Pj4+PiBiYWxsb29uIG5vdyB1
c2VzIGJhbGxvb24tY29tcGFjdGlvbiBpbmZyYXN0cnVjdHVyZSwgYW5kIHN1cHByZXNzZWQgdGhl
c2UKPiA+Pj4+Pj4gd2FybmluZ3MgYmVmb3JlLCBpdCBpcyBhbHNvIGJlbmVmaWNpYWwgdG8gc3Vw
cHJlc3MgdGhlc2Ugd2FybmluZ3MgdG8KPiA+Pj4+Pj4ga2VlcCB0aGUgc2FtZSBiZWhhdmlvciB0
aGF0IHRoZSBiYWxsb29uIGhhZCBiZWZvcmUuCj4gPj4+Pj4gCj4gPj4+Pj4gSSBhbSBub3Qgc3Vy
ZSBpZiB0aGF0J3MgYSBnb29kIGlkZWEuIFRoZSBhbGxvY2F0aW9uIHdhcm5pbmdzIGFyZSB1c3Vh
bGx5Cj4gPj4+Pj4gdGhlIG9ubHkgdHJhY2Ugb2YgInRoZSB1c2VyL2FkbWluIGRpZCBzb21ldGhp
bmcgYmFkIGJlY2F1c2UgaGUvc2hlIHRyaWVkCj4gPj4+Pj4gdG8gaW5mbGF0ZSB0aGUgYmFsbG9v
biB0byBhbiB1bnNhZmUgdmFsdWUiLiBCZWxpZXZlIG1lLCBJIHByb2Nlc3NlZCBhCj4gPj4+Pj4g
Y291cGxlIG9mIHN1Y2ggYnVncmVwb3J0cyByZWxhdGVkIHRvIHZpcnRpby1iYWxsb29uIGFuZCB0
aGUgd2FybmluZyB3ZXJlCj4gPj4+Pj4gdmVyeSBoZWxwZnVsIGZvciB0aGF0Lgo+ID4+Pj4gCj4g
Pj4+PiBPaywgc28gYSBtZXNzYWdlIGlzIG5lZWRlZCwgYnV0IGRvZXMgaXQgaGF2ZSB0byBiZSBh
IGdlbmVyaWMgZnJpZ2h0ZW5pbmcKPiA+Pj4+IHdhcm5pbmc/Cj4gPj4+PiAKPiA+Pj4+IEhvdyBh
Ym91dCB1c2luZyBfX0dGUF9OT1dBUk4sIGFuZCBpZiBhbGxvY2F0aW9uIGRvIHNvbWV0aGluZyBs
aWtlOgo+ID4+Pj4gCj4gPj4+PiBwcl93YXJuKOKAnEJhbGxvb24gbWVtb3J5IGFsbG9jYXRpb24g
ZmFpbGVk4oCdKTsKPiA+Pj4+IAo+ID4+Pj4gT3IgZXZlbiBzb21ldGhpbmcgbW9yZSBpbmZvcm1h
dGl2ZT8gVGhpcyB3b3VsZCBzdXJlbHkgYmUgbGVzcyBpbnRpbWlkYXRpbmcKPiA+Pj4+IGZvciBj
b21tb24gdXNlcnMuCj4gPj4+IAo+ID4+PiByYXRlbGltaXQgd291bGQgbWFrZSBzZW5zZSA6KQo+
ID4+PiAKPiA+Pj4gQW5kIHllcywgdGhpcyB3b3VsZCBjZXJ0YWlubHkgYmUgbmljZXIuCj4gPj4g
Cj4gPj4gVGhhbmtzLiBJIHdpbGwgcG9zdCB2MiBvZiB0aGUgcGF0Y2guCj4gPiAKPiA+IEFzIGRp
c2N1c3NlZCBpbiB2Miwgd2UgYWxyZWFkeSBwcmludCBhIHdhcm5pbmcgaW4gdmlydGlvLWJhbGxv
b24sIHNvIEkKPiA+IGFtIGZpbmUgd2l0aCB0aGlzIHBhdGNoLgo+ID4gCj4gPiBSZXZpZXdlZC1i
eTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gCj4gTWljaGFlbCwKPiAK
PiBJZiBpdCBpcyBwb3NzaWJsZSB0byBnZXQgaXQgdG8gNS4zLCB0byBhdm9pZCBiZWhhdmlvcmFs
IGNoYW5nZSBmb3IgVk13YXJlCj4gYmFsbG9vbiB1c2VycywgaXQgd291bGQgYmUgZ3JlYXQuCj4g
Cj4gVGhhbmtzLAo+IE5hZGF2CgpKdXN0IGJhY2sgZnJvbSB2YWNhdGlvbiwgSSdsbCB0cnkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
