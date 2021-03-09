Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E1216331CF2
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 03:25:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A741605CC;
	Tue,  9 Mar 2021 02:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yyC5OcZN5Hg; Tue,  9 Mar 2021 02:25:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B64C6F499;
	Tue,  9 Mar 2021 02:25:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3D4EC0012;
	Tue,  9 Mar 2021 02:25:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E9D2C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B85C4015D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMYoMPOlxMGq
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:25:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE80C4015B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615256722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lc5h0GfyvI7xx+Arv3sOyw+PpmTx52yrKALPXb2J8vk=;
 b=KkRuUBukvmWh9AV7SrBnzUKPJRgQszThAqZEeybMZoz5LfljrUR5SnAjx3voL+ChsfVD01
 /nnv5j8RKHzPganuvOQSSsPoosSH+9Ze1cIr+oF85gmDb/sYnBldsiysZDreC6Wgc8zmrN
 N0IJr1OYLAoJNBydOaqAXVpQPx6q7gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Wqq1xv3cNcOZ67RLXc7g1g-1; Mon, 08 Mar 2021 21:25:19 -0500
X-MC-Unique: Wqq1xv3cNcOZ67RLXc7g1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6F0387504F;
 Tue,  9 Mar 2021 02:25:17 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-202.pek2.redhat.com
 [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BF8B5D9D3;
 Tue,  9 Mar 2021 02:25:12 +0000 (UTC)
Subject: Re: [PATCH V2 4/4] vDPA/ifcvf: remove the version number string
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com
References: <20210308083525.382514-1-lingshan.zhu@intel.com>
 <20210308083525.382514-5-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cdd01cc0-4741-cf6e-2f7d-7294bf03a7ff@redhat.com>
Date: Tue, 9 Mar 2021 10:25:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308083525.382514-5-lingshan.zhu@intel.com>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMy84IDQ6MzUg5LiL5Y2ILCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgcmVtb3ZlcyB0aGUgdmVyc2lvbiBudW1iZXIgc3RyaW5nLCB1c2luZyBrZXJuZWwKPiB2ZXJz
aW9uIGlzIGVub3VnaC4KPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4u
emh1QGludGVsLmNvbT4KPiAtLS0KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KCgo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyB8IDIgLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5j
Cj4gaW5kZXggZmQ1YmVmYzVjYmNjLi5jMzRlMWVlYzZiNmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2
Zl9tYWluLmMKPiBAQCAtMTQsNyArMTQsNiBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3N5c2ZzLmg+
Cj4gICAjaW5jbHVkZSAiaWZjdmZfYmFzZS5oIgo+ICAgCj4gLSNkZWZpbmUgVkVSU0lPTl9TVFJJ
TkcgICIwLjEiCj4gICAjZGVmaW5lIERSSVZFUl9BVVRIT1IgICAiSW50ZWwgQ29ycG9yYXRpb24i
Cj4gICAjZGVmaW5lIElGQ1ZGX0RSSVZFUl9OQU1FICAgICAgICJpZmN2ZiIKPiAgIAo+IEBAIC01
MDMsNCArNTAyLDMgQEAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIGlmY3ZmX2RyaXZlciA9IHsK
PiAgIG1vZHVsZV9wY2lfZHJpdmVyKGlmY3ZmX2RyaXZlcik7Cj4gICAKPiAgIE1PRFVMRV9MSUNF
TlNFKCJHUEwgdjIiKTsKPiAtTU9EVUxFX1ZFUlNJT04oVkVSU0lPTl9TVFJJTkcpOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
