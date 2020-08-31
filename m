Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D636257599
	for <lists.virtualization@lfdr.de>; Mon, 31 Aug 2020 10:39:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1BF39858D4;
	Mon, 31 Aug 2020 08:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 76Yslu0CspsB; Mon, 31 Aug 2020 08:39:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BB138584A;
	Mon, 31 Aug 2020 08:39:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BE38C0051;
	Mon, 31 Aug 2020 08:39:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22C4AC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 08:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0ACE687594
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 08:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spbDaCAcj8W9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 08:39:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 216638754B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598863151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avRjm611h0EKFc/MNTXSAgeSYlfF4ysYrjX8e+z/BRg=;
 b=dYldlu5/WQ0Sj/ow+Kw1NKjvd8FOFtTqnjlWB0DY0HJT9CCbht4vIZeeeqc0xA6OogM86d
 K0K1m+KKcpBhjLBCnmqeckx3HXRe74rfRL+hbUJvkRtsTbjRsi6mmNzyy0tJMMlRG7w3SN
 x+bVO/oYd+3iajhyELVKFJJZk6+9NYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-N0n83FllNkSj5RFaVoTyEA-1; Mon, 31 Aug 2020 04:39:09 -0400
X-MC-Unique: N0n83FllNkSj5RFaVoTyEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8104802B6C;
 Mon, 31 Aug 2020 08:39:07 +0000 (UTC)
Received: from [10.72.12.88] (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13B795C22B;
 Mon, 31 Aug 2020 08:38:43 +0000 (UTC)
Subject: Re: [PATCH V2 2/3] vhost: vdpa: report iova range
To: Eli Cohen <elic@nvidia.com>
References: <20200821092813.8952-1-jasowang@redhat.com>
 <20200821092813.8952-3-jasowang@redhat.com>
 <20200823064035.GB147797@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <96f2367e-8b9f-9ee7-a45e-56e9162e92c6@redhat.com>
Date: Mon, 31 Aug 2020 16:38:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823064035.GB147797@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, lulu@redhat.com, mst@redhat.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, saugatm@xilinx.com, lingshan.zhu@intel.com,
 rob.miller@broadcom.com
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

Ck9uIDIwMjAvOC8yMyDkuIvljYgyOjQwLCBFbGkgQ29oZW4gd3JvdGU6Cj4+ICtzdGF0aWMgdm9p
ZCB2aG9zdF92ZHBhX3NldF9pb3ZhX3JhbmdlKHN0cnVjdCB2aG9zdF92ZHBhICp2KQo+PiArewo+
PiArCXN0cnVjdCB2ZHBhX2lvdmFfcmFuZ2UgKnJhbmdlID0gJnYtPnJhbmdlOwo+PiArCXN0cnVj
dCBpb21tdV9kb21haW5fZ2VvbWV0cnkgZ2VvOwo+PiArCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YSA9IHYtPnZkcGE7Cj4+ICsJY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdmRw
YS0+Y29uZmlnOwo+PiArCj4+ICsJaWYgKG9wcy0+Z2V0X2lvdmFfcmFuZ2UpIHsKPj4gKwkJKnJh
bmdlID0gb3BzLT5nZXRfaW92YV9yYW5nZSh2ZHBhKTsKPj4gKwl9IGVsc2UgaWYgKHYtPmRvbWFp
biAmJgo+PiArCQkgICAhaW9tbXVfZG9tYWluX2dldF9hdHRyKHYtPmRvbWFpbiwKPj4gKwkJICAg
RE9NQUlOX0FUVFJfR0VPTUVUUlksICZnZW8pICYmCj4+ICsJCSAgIGdlby5mb3JjZV9hcGVydHVy
ZSkgewo+PiArCQlyYW5nZS0+Zmlyc3QgPSBnZW8uYXBlcnR1cmVfc3RhcnQ7Cj4+ICsJCXJhbmdl
LT5sYXN0ID0gZ2VvLmFwZXJ0dXJlX2VuZDsKPj4gKwl9IGVsc2Ugewo+PiArCQlyYW5nZS0+Zmly
c3QgPSAwOwo+PiArCQlyYW5nZS0+bGFzdCA9IFVMTE9OR19NQVg7Cj4+ICsJfQo+IFNob3VsZG4n
dCB3ZSByZXF1aXJlIGRyaXZlcnMgdGhhdCBwdWJsaXNoIFZJUlRJT19GX0FDQ0VTU19QTEFURk9S
TSB0bwo+IGltcGxlbWVudCBnZXRfaW92YV9yYW5nZT8KCgpQcm9iYWJseSBub3QsIHNpbmNlIEFD
Q0VTU19QTEFURk9STSBkb2VzIG5vdCBleGNsdWRlIHRoZSBkZXZpY2UgdGhhdCAKZGVwZW5kcyBv
biB0aGUgY2hpcHNldCBJT01NVSB0byB3b3JrLiBTbyBpbiB0aGF0IGNhc2UsIHdlIHNob3VsZCBx
dWVyeSAKSU9NTVUgZHJpdmVyIGluc3RlYWQgb2YgdkRQQSBkZXZpY2UgZHJpdmVyLgoKVGhhbmtz
CgoKPgo+PiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
