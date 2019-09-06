Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 95553AB867
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 14:51:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E76D621BB;
	Fri,  6 Sep 2019 12:51:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23C1921BB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:51:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D2CA0756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:51:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 383D38980E3;
	Fri,  6 Sep 2019 12:51:39 +0000 (UTC)
Received: from [10.72.12.95] (ovpn-12-95.pek2.redhat.com [10.72.12.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D1A260605;
	Fri,  6 Sep 2019 12:51:30 +0000 (UTC)
Subject: Re: [PATCH 2/2] vhost: re-introducing metadata acceleration through
	kernel virtual address
To: Hillf Danton <hdanton@sina.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190906032154.9376-1-hdanton@sina.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cd2ed116-4b19-73b2-a3f0-4377cc0f2db3@redhat.com>
Date: Fri, 6 Sep 2019 20:51:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906032154.9376-1-hdanton@sina.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Fri, 06 Sep 2019 12:51:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, Christoph Hellwig <hch@infradead.org>,
	linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMTkvOS82IOS4iuWNiDExOjIxLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4gT24gVGh1LCAg
NSBTZXAgMjAxOSAyMDoyNzozNiArMDgwMCBGcm9tOiAgIEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+Cj4+ICtzdGF0aWMgdm9pZCB2aG9zdF9zZXRfbWFwX2RpcnR5KHN0cnVjdCB2aG9z
dF92aXJ0cXVldWUgKnZxLAo+PiArCQkJCXN0cnVjdCB2aG9zdF9tYXAgKm1hcCwgaW50IGluZGV4
KQo+PiArewo+PiArCXN0cnVjdCB2aG9zdF91YWRkciAqdWFkZHIgPSAmdnEtPnVhZGRyc1tpbmRl
eF07Cj4+ICsJaW50IGk7Cj4+ICsKPj4gKwlpZiAodWFkZHItPndyaXRlKSB7Cj4+ICsJCWZvciAo
aSA9IDA7IGkgPCBtYXAtPm5wYWdlczsgaSsrKQo+PiArCQkJc2V0X3BhZ2VfZGlydHkobWFwLT5w
YWdlc1tpXSk7Cj4+ICsJfQo+IE5vdCBzdXJlIG5lZWQgdG8gc2V0IHBhZ2UgZGlydHkgdW5kZXIg
cGFnZSBsb2NrLgoKCkp1c3QgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCB0aGUgaXNzdWUuIERv
IHlvdSBtZWFuIHRoZXJlJ3Mgbm8gbmVlZCAKZm9yIHNldF9wYWdlX2RpcnR5KCkgaGVyZT8gSWYg
eWVzLCBpcyB0aGVyZSBhbnkgb3RoZXIgZnVuY3Rpb24gdGhhdCAKYWxyZWFkeSBkaWQgdGhpcz8K
ClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
