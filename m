Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8BD2747B
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 04:37:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 04837F16;
	Thu, 23 May 2019 02:37:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B0323A64
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 02:37:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3FE7B5D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 02:37:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA1143082163;
	Thu, 23 May 2019 02:37:47 +0000 (UTC)
Received: from [10.72.12.128] (ovpn-12-128.pek2.redhat.com [10.72.12.128])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6D910AFEC9;
	Thu, 23 May 2019 02:37:40 +0000 (UTC)
Subject: Re: [PATCH V2 0/4] Prevent vhost kthread from hogging CPU
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
	<20190520085207-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <aa132e69-4646-da70-7def-b6ad72d4ebda@redhat.com>
Date: Thu, 23 May 2019 10:37:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520085207-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 23 May 2019 02:37:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com
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

Ck9uIDIwMTkvNS8yMCDkuIvljYg4OjUyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBNYXkgMTcsIDIwMTkgYXQgMTI6Mjk6NDhBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gSGk6Cj4+Cj4+IFRoaXMgc2VyaWVzIHRyeSB0byBwcmV2ZW50IGEgZ3Vlc3QgdHJpZ2dlcmFi
bGUgQ1BVIGhvZ2dpbmcgdGhyb3VnaAo+PiB2aG9zdCBrdGhyZWFkLiBUaGlzIGlzIGRvbmUgYnkg
aW50cm9kdWNpbmcgYW5kIGNoZWNraW5nIHRoZSB3ZWlnaHQKPj4gYWZ0ZXIgZWFjaCByZXF1cmVz
dC4gVGhlIHBhdGNoIGhhcyBiZWVuIHRlc3RlZCB3aXRoIHJlcHJvZHVjZXIgb2YKPj4gdnNvY2sg
YW5kIHZpcnRpby1uZXQuIE9ubHkgY29tcGlsZSB0ZXN0IGlzIGRvbmUgZm9yIHZob3N0LXNjc2ku
Cj4+Cj4+IFBsZWFzZSByZXZpZXcuCj4+IFRoaXMgYWRkcmVzc2VzIENWRS0yMDE5LTM5MDAuCj4g
T0sgSSB0aGluayB3ZSBzaG91bGQgY2xlYW4gdGhpcyBjb2RlIHNvbWUgbW9yZSBidXQgZ2l2ZW4K
PiBpdCdzIGEgQ1ZFIGZpeCBtYXliZSBpdCdzIGJlc3QgdG8gZG8gYXMgYSBwYXRjaCBvbiB0b3Au
Cj4KPiBBY2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPgo+Cj4gRGF2
ZSBkbyB5b3Ugd2FudCB0byBtZXJnZSB0aGlzIG9yIHNob3VsZCBJPwo+CgpBY2NvcmRpbmcgdG8g
RGF2aWQncyBsYXN0IHJlcGx5LCBpdCdzIGJldHRlciBmb3IgeW91IHRvIG1lcmdlIEkgdGhpbmsu
CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
