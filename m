Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D5AD1F2
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 04:31:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B8EF6B6D;
	Mon,  9 Sep 2019 02:30:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0DF74B5F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 02:30:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C5A026D6
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 02:30:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 278F160ACF;
	Mon,  9 Sep 2019 02:30:55 +0000 (UTC)
Received: from [10.72.12.61] (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B5E560166;
	Mon,  9 Sep 2019 02:30:24 +0000 (UTC)
Subject: Re: [PATCH 2/2] vhost: re-introducing metadata acceleration through
	kernel virtual address
From: Jason Wang <jasowang@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905122736.19768-3-jasowang@redhat.com>
	<20190908063618-mutt-send-email-mst@kernel.org>
	<1cb5aa8d-6213-5fce-5a77-fcada572c882@redhat.com>
Message-ID: <868bfaed-ede4-6da8-0247-af2a03ea121d@redhat.com>
Date: Mon, 9 Sep 2019 10:30:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1cb5aa8d-6213-5fce-5a77-fcada572c882@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 09 Sep 2019 02:30:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, Christoph Hellwig <hch@infradead.org>,
	linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-mm@kvack.org, jglisse@redhat.com, jgg@mellanox.com,
	David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOS85IOS4iuWNiDEwOjE4LCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIGEg
ZWxkZXIgQ1BVIFNhbmR5IEJyaWRnZSB3aXRob3V0IFNNQVAgc3VwcG9ydC4gVFggUFBTIGRvZXNu
J3Qgc2VlCj4+PiBhbnkgZGlmZmVyZW5jZS4KPj4gV2h5IGlzIG5vdCBLYWJ5IExha2Ugd2l0aCBT
TUFQIG9mZiB0aGUgc2FtZSBhcyBTYW5keSBCcmlkZ2U/Cj4KPgo+IEkgZG9uJ3Qga25vdywgSSBn
dWVzcyBpdCB3YXMgYmVjYXVzZSB0aGUgYXRvbWljIGlzIGwgCgoKU29ycnksIEkgbWVhbnQgYXRv
bWljIGNvc3RzIGxlc3MgZm9yIEthYnkgTGFrZS4KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
