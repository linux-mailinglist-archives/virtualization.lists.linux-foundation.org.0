Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A821C6BE8
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:38:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C530B86B11;
	Wed,  6 May 2020 08:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QA-B-N-fNCMI; Wed,  6 May 2020 08:37:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07C4586AB5;
	Wed,  6 May 2020 08:37:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D159EC0859;
	Wed,  6 May 2020 08:37:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 430F9C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2B6D4203E6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6F17umRzx+8Q
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:37:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 8EF8D24B78
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588754275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isTPirqR/XYh3iR61WK5j5e33CIaCCkNeFTS1LNebYU=;
 b=HQM3/aFDU/iE+J0/gLCEXo+YqDnx0akIaKdrCmr7kepV+4uWYX3TTLC+AlB0TljSsZ7umh
 C8SP+cMRhWSmFO1cPy3K9Be+mtU1B1djS2Y7EuTniSdkxkbEvwETXSlJAXow6WM/7K+BQO
 5tI9zwiwndD89FXW/+wjhLvh3SRAujk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-j3B4EDFvNmqfiTg9EvtdhA-1; Wed, 06 May 2020 04:37:53 -0400
X-MC-Unique: j3B4EDFvNmqfiTg9EvtdhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 229DB107ACF9;
 Wed,  6 May 2020 08:37:52 +0000 (UTC)
Received: from [10.72.13.165] (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B21160BF4;
 Wed,  6 May 2020 08:37:42 +0000 (UTC)
Subject: Re: performance bug in virtio net xdp
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200506035704-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7d801479-5572-0031-b306-a735ca4ce0e4@redhat.com>
Date: Wed, 6 May 2020 16:37:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506035704-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>, bpf@vger.kernel.org
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

Ck9uIDIwMjAvNS82IOS4i+WNiDQ6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBTbyBm
b3IgbWVyZ2VhYmxlIGJ1ZnMsIHdlIHVzZSBld21hIG1hY2hpbmVyeSB0byBndWVzcyB0aGUgY29y
cmVjdCBidWZmZXIKPiBzaXplLiBJZiB3ZSBkb24ndCBndWVzcyBjb3JyZWN0bHksIFhEUCBoYXMg
dG8gZG8gYWdncmVzc2l2ZSBjb3BpZXMuCj4KPiBQcm9ibGVtIGlzLCB4ZHAgcGF0aHMgZG8gbm90
IHVwZGF0ZSB0aGUgZXdtYSBhdCBhbGwsIGV4Y2VwdAo+IHNvbWV0aW1lcyB3aXRoIFhEUF9QQVNT
LiBTbyB3aGF0ZXZlciB3ZSBoYXBwZW4gdG8gaGF2ZQo+IGJlZm9yZSB3ZSBhdHRhY2ggWERQLCB3
aWxsIG1vc3RseSBzdGF5IGFyb3VuZC4KCgpJdCBsb29rcyBvayB0byBtZSBzaW5jZSB3ZSBhbHdh
eXMgdXNlIFBBR0VfU0laRSB3aGVuIFhEUCBpcyBlbmFibGVkIGluIApnZXRfbWVyZ2VhYmxlX2J1
Zl9sZW4oKT8KClRoYW5rcwoKCj4KPiBUaGUgZml4IGlzIHByb2JhYmx5IHRvIHVwZGF0ZSBld21h
IHVuY29uZGl0aW9uYWxseS4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
