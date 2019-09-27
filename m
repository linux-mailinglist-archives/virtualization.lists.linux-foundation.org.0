Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA18BFDCC
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 05:51:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D10A9F3B;
	Fri, 27 Sep 2019 03:51:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41B09E3B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 03:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 07C368A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 03:51:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FA283B58C;
	Fri, 27 Sep 2019 03:51:48 +0000 (UTC)
Received: from [10.72.12.160] (ovpn-12-160.pek2.redhat.com [10.72.12.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 295B1614C1;
	Fri, 27 Sep 2019 03:51:37 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
From: Jason Wang <jasowang@redhat.com>
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com, maxime.coquelin@redhat.com
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
Message-ID: <996bcaa3-1b13-2520-5be4-8a8f9c8c71d6@redhat.com>
Date: Fri, 27 Sep 2019 11:51:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 27 Sep 2019 03:51:48 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8yNyDkuIrljYgxMTo0NiwgSmFzb24gV2FuZyB3cm90ZToKPiArCj4gK3N0YXRp
YyBzdHJ1Y3QgbWRldl9jbGFzc19pZCBpZF90YWJsZVtdID0gewo+ICvCoMKgwqAgeyBNREVWX0lE
X1ZIT1NUIH0sCj4gK8KgwqDCoCB7IDAgfSwKPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgbWRl
dl9kcml2ZXIgdmhvc3RfbWRldl9kcml2ZXIgPSB7Cj4gK8KgwqDCoCAubmFtZcKgwqDCoCA9ICJ2
aG9zdF9tZGV2IiwKPiArwqDCoMKgIC5wcm9iZcKgwqDCoCA9IHZob3N0X21kZXZfcHJvYmUsCj4g
K8KgwqDCoCAucmVtb3ZlwqDCoMKgID0gdmhvc3RfbWRldl9yZW1vdmUsCj4gK8KgwqDCoCAuaWRf
dGFibGUgPSBpZF90YWJsZSwKPiArfTsKPiArIAoKCkFuZCB5b3UgcHJvYmFibHkgbmVlZCB0byBh
ZGQgTU9EVUxFX0RFVklDRV9UQUJMRSgpIGFzIHdlbGwuCgpUaGFua3MKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
