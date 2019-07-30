Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D87A5A0
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 12:09:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B648A261C;
	Tue, 30 Jul 2019 10:09:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8B9EF2519
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 10:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 44639D3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 10:03:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F9598112E;
	Tue, 30 Jul 2019 10:03:33 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C603C19C6A;
	Tue, 30 Jul 2019 10:03:25 +0000 (UTC)
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
To: Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190729095743-mutt-send-email-mst@kernel.org>
	<20190730094013.ruqjllqrjmkdnh5y@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fc568e3d-7af5-5895-89e8-32e35b0f9af4@redhat.com>
Date: Tue, 30 Jul 2019 18:03:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730094013.ruqjllqrjmkdnh5y@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 30 Jul 2019 10:03:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvNy8zMCDkuIvljYg1OjQwLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
TW9uLCBKdWwgMjksIDIwMTkgYXQgMDk6NTk6MjNBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+PiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwMTozMDoyNVBNICswMjAwLCBTdGVm
YW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4+PiBUaGlzIHNlcmllcyB0cmllcyB0byBpbmNyZWFzZSB0
aGUgdGhyb3VnaHB1dCBvZiB2aXJ0aW8tdnNvY2sgd2l0aCBzbGlnaHQKPj4+IGNoYW5nZXMuCj4+
PiBXaGlsZSBJIHdhcyB0ZXN0aW5nIHRoZSB2MiBvZiB0aGlzIHNlcmllcyBJIGRpc2NvdmVyZWQg
YW4gaHVnZSB1c2Ugb2YgbWVtb3J5LAo+Pj4gc28gSSBhZGRlZCBwYXRjaCAxIHRvIG1pdGlnYXRl
IHRoaXMgaXNzdWUuIEkgcHV0IGl0IGluIHRoaXMgc2VyaWVzIGluIG9yZGVyCj4+PiB0byBiZXR0
ZXIgdHJhY2sgdGhlIHBlcmZvcm1hbmNlIHRyZW5kcy4KPj4gU2VyaWVzOgo+Pgo+PiBBY2tlZC1i
eTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPj4KPj4gQ2FuIHRoaXMgZ28g
aW50byBuZXQtbmV4dD8KPj4KPiBJIHRoaW5rIHNvLgo+IE1pY2hhZWwsIFN0ZWZhbiB0aGFua3Mg
dG8gYWNrIHRoZSBzZXJpZXMhCj4KPiBTaG91bGQgSSByZXNlbmQgaXQgd2l0aCBuZXQtbmV4dCB0
YWc/Cj4KPiBUaGFua3MsCj4gU3RlZmFubwoKCkkgdGhpbmsgc28uCgpUaGFua3MKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
