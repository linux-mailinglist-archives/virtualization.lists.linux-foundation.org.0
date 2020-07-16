Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630E221FB9
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 11:32:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EFB7D87F8C;
	Thu, 16 Jul 2020 09:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_5WRORyNDof; Thu, 16 Jul 2020 09:32:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 786EA88E98;
	Thu, 16 Jul 2020 09:32:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D0B4C0733;
	Thu, 16 Jul 2020 09:32:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F30E4C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E03D28AEFD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxMwJ7cMaSj6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:32:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 410A88AEE6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594891971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM60XLMgdg8Xi8aOyww6UtyARMKxQfyJ5RsQS2i7liw=;
 b=WsSYkSC7vOztTb608Gr5QkH6Z5UY7akD3D7TIQUD943OX0XHCV8Z258RjFQhWGw/A0OeJC
 Q+2+uhPkSI48NITyeY1lrjCHigjhI/p7ycDRvKoEqmiI8hq9eZ+p8GAoZVwZwJCk1th3IM
 Fv/nhdGRUmU8ZeHhR+qZISYdkNh4uY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-lW23ye-FOHabPUgtOU_xMg-1; Thu, 16 Jul 2020 05:32:48 -0400
X-MC-Unique: lW23ye-FOHabPUgtOU_xMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9E5B1005260;
 Thu, 16 Jul 2020 09:32:46 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F01C5C1D2;
 Thu, 16 Jul 2020 09:32:39 +0000 (UTC)
Subject: Re: [PATCH vhost next 09/10] vdpa/mlx5: Add shared memory
 registration code
To: Eli Cohen <eli@mellanox.com>
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-10-eli@mellanox.com>
 <61765932-5411-9f37-3a4a-ca5ac5daa28e@redhat.com>
 <20200716082840.GB182860@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ad3c6157-2224-8e1f-7afb-deb9b45f568e@redhat.com>
Date: Thu, 16 Jul 2020 17:32:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716082840.GB182860@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg0OjI4LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MTYsIDIwMjAgYXQgMDQ6MTM6MjFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAy
MC83LzE2IOS4i+WNiDM6MjMsIEVsaSBDb2hlbiB3cm90ZToKPj4+IEFkZCBjb2RlIHRvIHN1cHBv
cnQgcmVnaXN0ZXJpbmcgZ3Vlc3QncyBtZW1vcnkgcmVnaW9uIGZvciB0aGUgZGV2aWNlLgo+Pgo+
PiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlICJ1c2Vyc3BhY2UiIG1lbW9yeSBoZXJlIHNpbmNl
IHZob3N0LXZEUEEKPj4gY291bGQgYmUgdXNlZCBieSBlLmcgZHBkayBhcHBsaWNhdGlvbiBvbiB0
aGUgaG9zdCBpbiB0aGUgZnV0dXJlLgo+Pgo+IEhvdyBhYm91dCByZXBsYWNpaW5nICJndWVzdCdz
IG1lbW9yeSIgd2l0aCAiYWRkcmVzcyBzcGFjZSIuIEl0IGlzIG1vcmUKPiBnZW5lcmFsIGFuZCBh
bGlnbnMgd2l0aCB0aGUgd2l0aCB0aGUgZmFjdCB0aGF0IHZpcmlvIGRyaXZlciBjYW4gcnVuIGlu
Cj4gdGhlIGd1ZXN0J3Mga2VybmVsLgoKClByb2JhYmx5IGJ1dCBub3RlIHRoYXQgZ3Vlc3QgZHJp
dmVyIGlzIG5vdCB0aGUgb25seSB1c2VyIGZvciB0aGlzLiBJdCAKY291bGQgYmUgZWl0aGVyOgoK
MSkgR3Vlc3QgdmlydGlvIGRyaXZlcgoyKSBVc2Vyc3BhY2UgdmlydGlvIGRyaXZlciBvbiB0aGUg
aG9zdAozKSBLZXJuZWwgdmlydGlvIGRyaXZlciBvbiB0aGUgaG9zdC4KClRoYW5rcwoKCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
