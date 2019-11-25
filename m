Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C01089F7
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 09:20:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02EF820009;
	Mon, 25 Nov 2019 08:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxm7Gy+kNCm1; Mon, 25 Nov 2019 08:20:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 35EC8204C8;
	Mon, 25 Nov 2019 08:20:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A614C0878;
	Mon, 25 Nov 2019 08:20:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2326DC0878
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 08:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1202787B08
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 08:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLNaAbJ3cbba
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 08:20:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5189887AB5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574670004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVpZi8JXk+Gn2x1ju+aRnIKTgySiGqpiCe8/VQiJ+ck=;
 b=b8x2cFEEB6ZmWGRtlHCQq0/pPAC7KnNYzRuMunR3PO1YOvyA6KioDsJLWwGUiIoBFFRTAg
 wZ4T0z4NJD1CSs5nHw/hfFs2JzgeUeCEU/G+RZVNqoRjQIJh/zA4HzHM8mTMNZ9JoFLDj3
 m7MGDTlR13oSRWnBFsr3ToqUYKB8SiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-IIzbJ_fvOUGlXrfXA5iL8g-1; Mon, 25 Nov 2019 03:20:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C663110CE780;
 Mon, 25 Nov 2019 08:19:58 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EF04608B0;
 Mon, 25 Nov 2019 08:19:47 +0000 (UTC)
Subject: Re: [RFC V4 2/2] This commit introduced IFC operations for vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com
References: <1574241431-24792-1-git-send-email-lingshan.zhu@intel.com>
 <1574241431-24792-3-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f4cd7ba4-953e-872a-42bd-aa1303c18458@redhat.com>
Date: Mon, 25 Nov 2019 16:19:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1574241431-24792-3-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: IIzbJ_fvOUGlXrfXA5iL8g-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
 jason.zeng@intel.com
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

Ck9uIDIwMTkvMTEvMjAg5LiL5Y2INToxNywgWmh1IExpbmdzaGFuIHdyb3RlOgo+ICsKPiArCWlm
ICghc3RyY21wKGtvYmotPm5hbWUsICJpZmN2Zi12aXJ0aW9fbWRldiIpKQo+ICsJCW1kZXZfdmly
dGlvX3NldF9jbGFzc19pZChtZGV2LE1ERVZfVklSVElPX0NMQVNTX0lEX1ZJUlRJTyk7Cj4gKwo+
ICsJaWYgKCFzdHJjbXAoa29iai0+bmFtZSwgImlmY3ZmLXZob3N0X21kZXYiKSkKPiArCQltZGV2
X3ZpcnRpb19zZXRfY2xhc3NfaWQobWRldixNREVWX1ZJUlRJT19DTEFTU19JRF9WSE9TVCk7Cj4g
Kwo+ICsJbWRldl9zZXRfZHJ2ZGF0YShtZGV2LCBhZGFwdGVyKTsKPiArCW1kZXZfc2V0X2lvbW11
X2RldmljZShtZGV2X2RldihtZGV2KSwgZGV2KTsKPiArCWFkYXB0ZXItPm1kZXZfY291bnQtLTsK
PiArCgoKVG8gYXZvaWQgY29uZnVzaW9uLCBpdCdzIGJldHRlciB0byBjYWxsIG1kZXZfc2V0X2lv
bW11X2RldmljZSgpIG9ubHkgZm9yIAp0aGUgY2FzZSBvZiB2aG9zdC4gRm9yIHZpcnRpbywgaXQg
ZG9lc24ndCBkZXBlbmRzIG9uIHRoYXQgdG8gd29yay4KClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
