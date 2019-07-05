Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCA5FF06
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 02:19:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 278A8B7D;
	Fri,  5 Jul 2019 00:18:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9B18F504
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 00:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4906170D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 00:18:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0D8530001E2;
	Fri,  5 Jul 2019 00:18:56 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81CA517795;
	Fri,  5 Jul 2019 00:18:45 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] vsock/virtio: use RCU to avoid use-after-free on
	the_virtio_vsock
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190628123659.139576-1-sgarzare@redhat.com>
	<20190628123659.139576-2-sgarzare@redhat.com>
	<05311244-ed23-d061-a620-7b83d83c11f5@redhat.com>
	<20190703104135.wg34dobv64k7u4jo@steredhat>
	<07e5bc00-ebde-4dac-d38c-f008fa230b5f@redhat.com>
	<20190704092044.23gd5o2rhqarisgg@steredhat.homenet.telecomitalia.it>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <23c014de-90b5-1de2-a118-63ec242cbf62@redhat.com>
Date: Fri, 5 Jul 2019 08:18:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704092044.23gd5o2rhqarisgg@steredhat.homenet.telecomitalia.it>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 05 Jul 2019 00:18:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

Ck9uIDIwMTkvNy80IOS4i+WNiDU6MjAsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4+PiBU
aGlzIGlzIHN0aWxsIHN1c3BpY2lvdXMsIGNhbiB3ZSBhY2Nlc3MgdGhlX3ZpcnRpb192c29jayB0
aHJvdWdoIHZkZXYtPnByaXY/Cj4+Pj4gSWYgeWVzLCB3ZSBtYXkgc3RpbGwgZ2V0IHVzZS1hZnRl
ci1mcmVlIHNpbmNlIGl0IHdhcyBub3QgcHJvdGVjdGVkIGJ5IFJDVS4KPj4+IFdlIHdpbGwgZnJl
ZSB0aGUgb2JqZWN0IG9ubHkgYWZ0ZXIgY2FsbGluZyB0aGUgZGVsX3ZxcygpLCBzbyB3ZSBhcmUg
c3VyZQo+Pj4gdGhhdCB0aGUgdnFfY2FsbGJhY2tzIGVuZGVkIGFuZCB3aWxsIG5vIGxvbmdlciBi
ZSBpbnZva2VkLgo+Pj4gU28sIElJVUMgaXQgc2hvdWxkbid0IGhhcHBlbi4KPj4gWWVzLCBidXQg
YW55IGRlcmVmZXJlbmNlIHRoYXQgaXMgbm90IGRvbmUgaW4gdnFfY2FsbGJhY2tzIHdpbGwgYmUg
dmVyeQo+PiBkYW5nZXJvdXMgaW4gdGhlIGZ1dHVyZS4KPiBSaWdodC4KPgo+IERvIHlvdSB0aGlu
ayBtYWtlIHNlbnNlIHRvIGNvbnRpbnVlIHdpdGggdGhpcyBzZXJpZXMgaW4gb3JkZXIgdG8gZml4
IHRoZQo+IGhvdC11bnBsdWcgaXNzdWUsIHRoZW4gSSdsbCB3b3JrIHRvIHJlZmFjdG9yIHRoZSBk
cml2ZXIgY29kZSB0byB1c2UgdGhlIHJlZmNudAo+IChhcyB5b3Ugc3VnZ2VzdGVkIGluIHBhdGNo
IDIpIGFuZCBzaW5nbGV0b24gZm9yIHRoZV92aXJ0aW9fdnNvY2s/Cj4KPiBUaGFua3MsCj4gU3Rl
ZmFubwoKClllcy4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
