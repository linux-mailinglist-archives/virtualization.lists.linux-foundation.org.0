Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C2C1FC494
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 05:19:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 138832153D;
	Wed, 17 Jun 2020 03:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ovu8HoH1cv8q; Wed, 17 Jun 2020 03:19:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 76AC221526;
	Wed, 17 Jun 2020 03:19:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F516C016E;
	Wed, 17 Jun 2020 03:19:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DD91C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 81739875EA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnDwkofW1dn1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C6C1D876CF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592363975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mq/stawXjx0dcB0y1QUsFlRW19BEay/7Pm1Vse2Y1ZY=;
 b=g6BI0oo00Bt7qVf6Rbv5ZTwJdYCiQ46PyGzqOjAPQ+Fu9/t/PFWJ+eCk8OznU9piF+p/Ri
 ycXWTuwOcWPQAmP+FyMHFJNKMM/8FY23r1Vmox5wF+CHSriKnaag2dyZTdWGJMHuDRTk87
 ag2fa+dhgDqxCXdKWp4srBsM8pa791s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-xkJ2Kb9hMbC8iI2CXnx6hw-1; Tue, 16 Jun 2020 23:19:33 -0400
X-MC-Unique: xkJ2Kb9hMbC8iI2CXnx6hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A81C910059A6;
 Wed, 17 Jun 2020 03:19:32 +0000 (UTC)
Received: from [10.72.13.217] (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D49205D9D3;
 Wed, 17 Jun 2020 03:19:27 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0332b0cf-cf00-9216-042c-e870efa33626@redhat.com>
Date: Wed, 17 Jun 2020 11:19:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611113404.17810-3-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNi8xMSDkuIvljYg3OjM0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gICBz
dGF0aWMgdm9pZCB2aG9zdF92cV9mcmVlX2lvdmVjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2
cSkKPiAgIHsKPiAgIAlrZnJlZSh2cS0+ZGVzY3MpOwo+IEBAIC0zOTQsNiArNDAwLDkgQEAgc3Rh
dGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCj4g
ICAJZm9yIChpID0gMDsgaSA8IGRldi0+bnZxczsgKytpKSB7Cj4gICAJCXZxID0gZGV2LT52cXNb
aV07Cj4gICAJCXZxLT5tYXhfZGVzY3MgPSBkZXYtPmlvdl9saW1pdDsKPiArCQlpZiAodmhvc3Rf
dnFfbnVtX2JhdGNoX2Rlc2NzKHZxKSA8IDApIHsKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJ
fQoKClRoaXMgY2hlY2sgYnJlYWtzIHZkcGEgd2hpY2ggc2V0IGlvdl9saW1pdCB0byB6ZXJvLiBD
b25zaWRlciBpb3ZfbGltaXQgCmlzIG1lYW5pbmdsZXNzIHRvIHZEUEEsIEkgd29uZGVyIHdlIGNh
biBza2lwIHRoZSB0ZXN0IHdoZW4gZGV2aWNlIApkb2Vzbid0IHVzZSB3b3JrZXIuCgpUaGFua3MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
