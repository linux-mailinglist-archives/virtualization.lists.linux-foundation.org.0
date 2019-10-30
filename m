Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A12EA187
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 17:13:29 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4F34EE4;
	Wed, 30 Oct 2019 16:13:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6A02E9D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 16:13:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 647B763D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 16:13:22 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E359021835;
	Wed, 30 Oct 2019 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572452002;
	bh=3qJqBN+e8dBuilJ6PsPEhoxNSDsrgSVAJo67NSJODOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=islkidXPfDEuE3NavRFKgjg4gPgBCD09TLxUbdb+4uX0iMWOC0o9e7/oZcMMCk9ZK
	I2FH8vDJKu7VXXxtryjLcB7LB6VE5gR9WoXRjmhS7SDOTGhibwdwljDHo2Q8Bg5kYL
	+9JfdXQl5PAMfa+ItaIQw+Qbnhz2gPnfB05M+bP8=
Date: Wed, 30 Oct 2019 16:13:17 +0000
From: Will Deacon <will@kernel.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: read_barrier_depends() usage in vhost.c
Message-ID: <20191030161317.GA20094@willie-the-truck>
References: <20191016233340.djrr7o7dwueqccac@willie-the-truck>
	<2429dbbc-ec80-3a76-82ff-481c0523f68a@redhat.com>
	<20191018205814.nbawp3btlpr5p2rf@willie-the-truck>
	<d0219a18-b7be-1e43-559f-ab6c58483115@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0219a18-b7be-1e43-559f-ab6c58483115@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@lists.infradead.org, paulmck@kernel.org, mst@redhat.com,
	peterz@infradead.org, virtualization@lists.linux-foundation.org,
	stern@rowland.harvard.edu
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

SGkgSmFzb24sCgpPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAwMTo0ODo1M1BNICswODAwLCBKYXNv
biBXYW5nIHdyb3RlOgo+IE9uIDIwMTkvMTAvMTkg5LiK5Y2INDo1OCwgV2lsbCBEZWFjb24gd3Jv
dGU6Cj4gPiBTdGFyaW5nIGF0IHRoZSBjb2RlIHNvbWUgbW9yZSwgbXkgYmVzdCBiZXQgYXQgdGhl
IG1vbWVudAo+ID4gaXMgdGhhdCB0aGUgbG9hZCBvZiAnaW5kaXJlY3QtPmFkZHInIGlzIHByb2Jh
Ymx5IHRoZSBvbmUgdG8gd29ycnkgYWJvdXQsCj4gPiBzaW5jZSBpdCdzIHBhcnQgb2YgdGhlIHZy
aW5nIGFuZCBjYW4gYmUgdXBkYXRlZCBjb25jdXJyZW50bHkuCj4gCj4gSSdtIGFsc28gY29uZnVz
ZWQgYWJvdXQgdGhlIGJhcnJpZXIgaGVyZSwgYmFzaWNhbGx5IGluIGRyaXZlciBzaWRlIHdlIGRp
ZDoKPiAKPiAxKSBhbGxvY2F0ZSBwYWdlcwo+IAo+IDIpIHN0b3JlIHBhZ2VzIGluIGluZGlyZWN0
LT5hZGRyCj4gCj4gMykgc21wX3dtYigpCj4gCj4gNCkgaW5jcmVhc2UgdGhlIGF2YWlsIGlkeCAo
c29tZWhvdyBhIHRhaWwgcG9pbnRlciBvZiB2cmluZykKPiAKPiBpbiB2aG9zdCB3ZSBkaWQ6Cj4g
Cj4gMSkgcmVhZCBhdmFpbCBpZHgKPiAKPiAyKSBzbXBfcm1iKCkKPiAKPiAzKSByZWFkIGluZGly
ZWN0LT5hZGRyCj4gCj4gNCkgcmVhZCBmcm9tIGluZGlyZWN0LT5hZGRyCj4gCj4gSXQgbG9va3Mg
dG8gbWUgZXZlbiB0aGUgZGF0YSBkZXBlbmRlbmN5IGJhcnJpZXIgaXMgbm90IG5lY2Vzc2FyeSBz
aW5jZSB3ZQo+IGhhdmUgcm1iKCkgd2hpY2ggaXMgc3VmZmljaWVudCBmb3IgdXMgdG8gdGhlIGNv
cnJlY3QgaW5kaXJlY3QtPmFkZHIgYW5kCj4gZHJpdmVyIGFyZSBub3QgZXhwZWN0ZWQgdG8gZG8g
YW55IHdyaXRpbmcgdG8gaW5kaXJlY3QtPmFkZHIgYWZ0ZXIgYXZhaWwgaWR4Cj4gaXMgaW5jcmVh
c2VkID8KClRoYXQgbWFrZXMgc2Vuc2UgdG8gbWU6IHRoZSBzeW5jaHJvbml6YXRpb24gaXMgZG9u
ZSB2aWEgdnEtPmF2YWlsX2lkeCgpCmFuZCBzbyB0aGUgc3Vic2VxdWVudCBhY2Nlc3Mgb2YgdGhl
IGluZGlyZWN0IHBhZ2VzIGRvZXNuJ3QgbmVlZCBhZGRpdGlvbmFsCmJhcnJpZXJzLCBldmVuIG9u
IEFscGhhLiBUaGFua3MuCgpJJ2xsIHdyaXRlIHVwIGEgcGF0Y2ggYW5kIGFkb3B0IHlvdXIgZXhw
bGFuYXRpb24gYWJvdmUuCgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
