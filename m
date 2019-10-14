Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A83D5D9B
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 10:36:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F6AA2665;
	Mon, 14 Oct 2019 08:36:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1E461254A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 08:21:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D56DC5D3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 08:21:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65465859FC;
	Mon, 14 Oct 2019 08:21:52 +0000 (UTC)
Received: from [10.72.12.241] (ovpn-12-241.pek2.redhat.com [10.72.12.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD2ED1001938;
	Mon, 14 Oct 2019 08:21:39 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190830094059.c7qo5cxrp2nkrncd@steredhat>
	<20190901024525-mutt-send-email-mst@kernel.org>
	<CAGxU2F7fA5UtkuMQbOHHy0noOGZUtpepBNKFg5afD81bynMVUQ@mail.gmail.com>
	<20191014081724.GD22963@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2398c960-b6d7-8af3-fa25-d75344335db7@redhat.com>
Date: Mon, 14 Oct 2019 16:21:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191014081724.GD22963@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 14 Oct 2019 08:21:52 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

Ck9uIDIwMTkvMTAvMTQg5LiL5Y2INDoxNywgU3RlZmFuIEhham5vY3ppIHdyb3RlOgo+IFNPX1ZN
X1NPQ0tFVFNfQlVGRkVSX1NJWkUgbWlnaHQgaGF2ZSBiZWVuIHVzZWZ1bCBmb3IgVk1DSS1zcGVj
aWZpYwo+IGFwcGxpY2F0aW9ucywgYnV0IHdlIHNob3VsZCB1c2UgU09fUkNWQlVGIGFuZCBTT19T
TkRCVUYgZm9yIHBvcnRhYmxlCj4gYXBwbGljYXRpb25zIGluIHRoZSBmdXR1cmUuICBUaG9zZSBz
b2NrZXQgb3B0aW9ucyBhbHNvIHdvcmsgd2l0aCBvdGhlcgo+IGFkZHJlc3MgZmFtaWxpZXMuCj4K
PiBJIGd1ZXNzIHRoZXNlIHNvY2tvcHRzIGFyZSBieXBhc3NlZCBieSBBRl9WU09DSyBiZWNhdXNl
IGl0IGRvZXNuJ3QgdXNlCj4gdGhlIGNvbW1vbiBza2IgcXVldWluZyBjb2RlIGluIG5ldC9jb3Jl
L3NvY2suYzooLiAgQnV0IG9uZSBkYXkgd2UgbWlnaHQKPiBtaWdyYXRlIHRvIGl0Li4uCj4KPiBT
dGVmYW4KCgorMSwgd2Ugc2hvdWxkIHJlYWxseSBjb25zaWRlciB0byByZXVzZSB0aGUgZXhpc3Qg
c29ja2V0IG1lY2hhbmlzbSAKaW5zdGVhZCBvZiByZS1pbnZlbnRpbmcgd2hlZWxzLgoKVGhhbmtz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
