Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E88E32B
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 05:28:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24238C4E;
	Thu, 15 Aug 2019 03:28:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9369CC4E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 03:28:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4370ECF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 03:28:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD71CC055673;
	Thu, 15 Aug 2019 03:28:12 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A9C85D9DC;
	Thu, 15 Aug 2019 03:28:07 +0000 (UTC)
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<20190812130252.GE24457@ziepe.ca>
	<9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
	<20190813115707.GC29508@ziepe.ca>
	<20190813164105.GD22640@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bba46127-ea43-f9f3-eece-0910243782c5@redhat.com>
Date: Thu, 15 Aug 2019 11:28:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813164105.GD22640@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 03:28:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

Ck9uIDIwMTkvOC8xNCDkuIrljYgxMjo0MSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24g
VHVlLCBBdWcgMTMsIDIwMTkgYXQgMDg6NTc6MDdBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdy
b3RlOgo+PiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAwNDozMTowN1BNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+Pgo+Pj4gV2hhdCBraW5kIG9mIGlzc3VlcyBkbyB5b3Ugc2VlPyBTcGlubG9j
ayBpcyB0byBzeW5jaHJvbml6ZSBHVVAgd2l0aCBNTVUKPj4+IG5vdGlmaWVyIGluIHRoaXMgc2Vy
aWVzLgo+PiBBIEdVUCB0aGF0IGNhbid0IHNsZWVwIGNhbid0IHBhZ2VmYXVsdCB3aGljaCBtYWtl
cyBpdCBhIHJlYWxseSB3ZWlyZAo+PiBwYXR0ZXJuCj4gZ2V0X3VzZXJfcGFnZXMvZ2V0X3VzZXJf
cGFnZXNfZmFzdCBtdXN0IG5vdCBiZSBjYWxsZWQgdW5kZXIgYSBzcGlubG9jay4KPiBXZSBoYXZl
IHRoZSBzb21ld2hhdCBtaXNuYW1lZCBfX2dldF91c2VyX3BhZ2VfZmFzdCB0aGF0IGp1c3QgZG9l
cyBhCj4gbG9va3VwIGZvciBleGlzdGluZyBwYWdlcyBhbmQgbmV2ZXIgZmF1bHRzIGZvciBhIGZl
dyBwbGFjZXMgdGhhdCBuZWVkCj4gdG8gZG8gdGhhdCBsb29rdXAgZnJvbSBjb250ZXh0cyB3aGVy
ZSB3ZSBjYW4ndCBzbGVlcC4KCgpZZXMsIEkgZG8gdXNlIF9fZ2V0X3VzZXJfcGFnZXNfZmFzdCgp
IGluIHRoZSBjb2RlLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
