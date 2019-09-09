Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DB560AD3CD
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 09:24:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E6FE349F;
	Mon,  9 Sep 2019 07:24:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC85B49F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FBF6EC
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E367E18C428C;
	Mon,  9 Sep 2019 07:24:07 +0000 (UTC)
Received: from [10.72.12.61] (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 970AF1001948;
	Mon,  9 Sep 2019 07:24:00 +0000 (UTC)
Subject: Re: [PATCH 2/2] vhost: re-introducing metadata acceleration through
	kernel virtual address
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905122736.19768-3-jasowang@redhat.com>
	<20190908063618-mutt-send-email-mst@kernel.org>
	<1cb5aa8d-6213-5fce-5a77-fcada572c882@redhat.com>
	<20190909004504-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4ee20058-0beb-111c-6750-556965423f04@redhat.com>
Date: Mon, 9 Sep 2019 15:23:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909004504-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Mon, 09 Sep 2019 07:24:08 +0000 (UTC)
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

Ck9uIDIwMTkvOS85IOS4i+WNiDEyOjQ1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBT
aW5jZSBpZHggY2FuIGJlIHNwZWN1bGF0ZWQsIEkgZ3Vlc3Mgd2UgbmVlZCBhcnJheV9pbmRleF9u
b3NwZWMgaGVyZT8KPj4gU28gd2UgaGF2ZQo+Pgo+PiBBQ1FVSVJFKG1tdV9sb2NrKQo+Pgo+PiBn
ZXQgaWR4Cj4+Cj4+IFJFTEVBU0UobW11X2xvY2spCj4+Cj4+IEFDUVVJUkUobW11X2xvY2spCj4+
Cj4+IHJlYWQgYXJyYXlbaWR4XQo+Pgo+PiBSRUxFQVNFKG1tdV9sb2NrKQo+Pgo+PiBUaGVuIEkg
dGhpbmsgaWR4IGNhbid0IGJlIHNwZWN1bGF0ZWQgY29uc2lkZXIgd2UndmUgcGFzc2VkIFJFTEVB
U0UgKwo+PiBBQ1FVSVJFPwo+IEkgZG9uJ3QgdGhpbmsgbWVtb3J5IGJhcnJpZXJzIGhhdmUgYW55
dGhpbmcgdG8gZG8gd2l0aCBzcGVjdWxhdGlvbiwKPiB0aGV5IGFyZSBhcmNoaXRlY3R1cmFsLgo+
CgpPaCByaWdodC4gTGV0IG1lIGFkZCBhcnJheV9pbmRleF9ub3NwZWMoKSBpbiBuZXh0IHZlcnNp
b24uCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
