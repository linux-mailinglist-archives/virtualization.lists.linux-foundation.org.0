Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC3D8B9E
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 10:46:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96D53491;
	Wed, 16 Oct 2019 08:46:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F0C6491
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 08:46:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC9B013A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 08:46:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36A703C93A;
	Wed, 16 Oct 2019 08:46:27 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A430E60166;
	Wed, 16 Oct 2019 08:45:58 +0000 (UTC)
Subject: Re: [RFC 1/2] vhost: IFC VF hardware operation layer
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com
References: <20191016013050.3918-1-lingshan.zhu@intel.com>
	<20191016013050.3918-2-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2d711b6b-3bdc-afaa-8110-beebd6c5a896@redhat.com>
Date: Wed, 16 Oct 2019 16:45:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191016013050.3918-2-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 16 Oct 2019 08:46:27 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	UPPERCASE_50_75 autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com
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

Ck9uIDIwMTkvMTAvMTYg5LiK5Y2IOTozMCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+ICsgKi8KPiAr
I2RlZmluZSBJRkNWRl9UUkFOU1BPUlRfRl9TVEFSVCAyOAo+ICsjZGVmaW5lIElGQ1ZGX1RSQU5T
UE9SVF9GX0VORCAgIDM0Cj4gKwo+ICsjZGVmaW5lIElGQ19TVVBQT1JURURfRkVBVFVSRVMgXAo+
ICsJCSgoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfTUFDKQkJCXwgXAo+ICsJCSAoMVVMTCA8PCBWSVJU
SU9fRl9BTllfTEFZT1VUKQkJCXwgXAo+ICsJCSAoMVVMTCA8PCBWSVJUSU9fRl9WRVJTSU9OXzEp
CQkJfCBcCj4gKwkJICgxVUxMIDw8IFZIT1NUX0ZfTE9HX0FMTCkJCQl8IFwKCgpMZXQncyBhdm9p
ZCB1c2luZyBWSE9TVF9GX0xPR19BTEwsIHVzaW5nIHRoZSBnZXRfbWRldl9mZWF0dXJlcygpIGlu
c3RlYWQuCgoKPiArCQkgKDFVTEwgPDwgVklSVElPX05FVF9GX0dVRVNUX0FOTk9VTkNFKQkJfCBc
Cj4gKwkJICgxVUxMIDw8IFZJUlRJT19ORVRfRl9DVFJMX1ZRKQkJCXwgXAo+ICsJCSAoMVVMTCA8
PCBWSVJUSU9fTkVUX0ZfU1RBVFVTKQkJCXwgXAo+ICsJCSAoMVVMTCA8PCBWSVJUSU9fTkVUX0Zf
TVJHX1JYQlVGKSkgLyogbm90IGZ1bGx5IHN1cHBvcnRlZCAqLwoKCldoeSBub3QgaGF2aW5nIFZJ
UlRJT19GX0lPTU1VX1BMQVRGT1JNIGFuZCBWSVJUSU9fRl9PUkRFUl9QTEFURk9STT8KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
