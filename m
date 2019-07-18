Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF916CCCC
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 12:32:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 21E2A13DA;
	Thu, 18 Jul 2019 10:32:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DED2A130A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 10:31:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A1AE25A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 10:31:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB7823084029;
	Thu, 18 Jul 2019 10:31:54 +0000 (UTC)
Received: from [10.72.12.199] (ovpn-12-199.pek2.redhat.com [10.72.12.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 814325D6A9;
	Thu, 18 Jul 2019 10:31:42 +0000 (UTC)
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
From: Jason Wang <jasowang@redhat.com>
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190703115245.GA22374@___>
	<64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
	<20190703130817.GA1978@___>
	<b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
	<20190704062134.GA21116@___> <20190705084946.67b8f9f5@x1.home>
	<20190708061625.GA15936@___>
	<deae5ede-57e9-41e6-ea42-d84e07ca480a@redhat.com>
	<20190709063317.GA29300@___>
	<9aafdc4d-0203-b96e-c205-043db132eb06@redhat.com>
	<20190710062233.GA16212@___>
	<1b49aa84-2c1f-eec2-2809-711e1f2dd7de@redhat.com>
Message-ID: <90e6a722-ce7b-2ab3-0d2d-19b2ca09f2d1@redhat.com>
Date: Thu, 18 Jul 2019 18:31:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b49aa84-2c1f-eec2-2809-711e1f2dd7de@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 18 Jul 2019 10:31:54 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: idos@mellanox.com, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com,
	Rob Miller <rob.miller@broadcom.com>
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

Ck9uIDIwMTkvNy8xMCDkuIvljYgzOjIyLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBZZWFoLCB0aGF0
J3MgYSBtYWpvciBjb25jZXJuLiBJZiBpdCdzIHRydWUsIGlzIGl0IHNvbWV0aGluZwo+PiB0aGF0
J3Mgbm90IGFjY2VwdGFibGU/Cj4KPgo+IEkgdGhpbmsgbm90LCBidXQgSSBkb24ndCBrbm93IGlm
IGFueSBvdGhlciBvbmUgdGhhdCBjYXJlIHRoaXMuCj4KPgo+Pgo+Pj4gQW5kIEkgZG8gc2VlIHNv
bWUgbmV3IFJGQyBmb3IgVkZJTyB0byBhZGQgbW9yZSBETUEgQVBJLgo+PiBJcyB0aGVyZSBhbnkg
cG9pbnRlcnM/Cj4KPgo+IEkgZG9uJ3QgcmVtZW1iZXIgdGhlIGRldGFpbHMsIGJ1dCBpdCBzaG91
bGQgYmUgc29tZXRoaW5nIHJlbGF0ZWQgdG8gCj4gU1ZBIHN1cHBvcnQgaW4gcmVjZW50IGludGVs
IElPTU1VLgoKCkUuZyB0aGlzIHNlcmllczoKCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3Rz
L2lvbW11L21zZzM3MTQ2Lmh0bWwKClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
