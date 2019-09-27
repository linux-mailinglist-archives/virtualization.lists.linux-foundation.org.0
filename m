Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401EBFFDF
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 09:15:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0FFACF7E;
	Fri, 27 Sep 2019 07:14:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A2F9DF74
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 07:14:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 206858A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 07:14:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 557223090FD3;
	Fri, 27 Sep 2019 07:14:55 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52410608A5;
	Fri, 27 Sep 2019 07:14:44 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <49bb0777-3761-3737-8e5b-568957f9a935@redhat.com>
Date: Fri, 27 Sep 2019 15:14:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927045438.GA17152@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 27 Sep 2019 07:14:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8yNyDkuIvljYgxMjo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gKwo+Pj4gKwkJ
LyoKPj4+ICsJCSAqIEluIHZob3N0LW1kZXYsIHVzZXJzcGFjZSBzaG91bGQgcGFzcyByaW5nIGFk
ZHJlc3Nlcwo+Pj4gKwkJICogaW4gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2VzIHdoZW4gSU9NTVUg
aXMgZGlzYWJsZWQgb3IKPj4+ICsJCSAqIElPVkFzIHdoZW4gSU9NTVUgaXMgZW5hYmxlZC4KPj4+
ICsJCSAqLwo+PiBBIHF1ZXN0aW9uIGhlcmUsIGNvbnNpZGVyIHdlJ3JlIHVzaW5nIG5vaW9tbXUg
bW9kZS4gSWYgZ3Vlc3QgcGh5c2ljYWwKPj4gYWRkcmVzcyBpcyBwYXNzZWQgaGVyZSwgaG93IGNh
biBhIGRldmljZSB1c2UgdGhhdD8KPj4KPj4gSSBiZWxpZXZlIHlvdSBtZWFudCAiaG9zdCBwaHlz
aWNhbCBhZGRyZXNzIiBoZXJlPyBBbmQgaXQgYWxzbyBoYXZlIHRoZQo+PiBpbXBsaWNhdGlvbiB0
aGF0IHRoZSBIUEEgc2hvdWxkIGJlIGNvbnRpbnVvdXMgKGUuZyB1c2luZyBodWdldGxiZnMpLgo+
IFRoZSBjb21tZW50IGlzIHRhbGtpbmcgYWJvdXQgdGhlIHZpcnR1YWwgSU9NTVUgKGkuZS4gaW90
bGIgaW4gdmhvc3QpLgo+IEl0IHNob3VsZCBiZSByZXBocmFzZWQgdG8gY292ZXIgdGhlIG5vaW9t
bXUgY2FzZSBhcyB3ZWxsLiBUaGFua3MgZm9yCj4gc3BvdHRpbmcgdGhpcy4KCgpTbyB0aGUgcXVl
c3Rpb24gc3RpbGwsIGlmIEdQQSBpcyBwYXNzZWQgaG93IGNhbiBpdCBiZSB1c2VkIGJ5IHRoZSAK
dmlydGlvLW1kZXYgZGV2aWNlPwoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
