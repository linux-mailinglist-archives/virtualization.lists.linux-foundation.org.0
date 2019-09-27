Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 37494BFFE5
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 09:17:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8CC84F7F;
	Fri, 27 Sep 2019 07:17:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9882F74
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 07:17:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B24588A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 07:17:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33E1B2114;
	Fri, 27 Sep 2019 07:17:37 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1A81000337;
	Fri, 27 Sep 2019 07:17:26 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <64a1f619-138f-cd21-e996-84724935e4c8@redhat.com>
Date: Fri, 27 Sep 2019 15:17:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927045438.GA17152@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Fri, 27 Sep 2019 07:17:37 +0000 (UTC)
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

Ck9uIDIwMTkvOS8yNyDkuIvljYgxMjo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+PiBUaGUgbmFtZSBj
b3VsZCBiZSBjb25mdXNpbmcsIGdldF9xdWV1ZV9tYXgoKSBpcyB0byBnZXQgdGhlIG1heGltdW0g
bnVtYmVyIG9mCj4+IGVudHJpZXMgZm9yIGEgdmlydHF1ZXVlIHN1cHBvcnRlZCBieSB0aGlzIGRl
dmljZS4KPiBPSy4gSXQgbWlnaHQgYmUgYmV0dGVyIHRvIHJlbmFtZSBpdCB0byBzb21ldGhpbmcg
bGlrZToKPgo+IAlnZXRfdnFfbnVtX21heCgpCj4KPiB3aGljaCBpcyBtb3JlIGNvbnNpc3RlbnQg
d2l0aCB0aGUgc2V0X3ZxX251bSgpLgo+CgpZZXMsIHdpbGwgZG8gaW4gbmV4dCB2ZXJzaW9uLgoK
VGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
