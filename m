Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E92324CC
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 20:41:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78D0A84836;
	Wed, 29 Jul 2020 18:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyoZMW_hASc0; Wed, 29 Jul 2020 18:41:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A14D847A7;
	Wed, 29 Jul 2020 18:41:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B4ACC004D;
	Wed, 29 Jul 2020 18:41:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DA0EC004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 18:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 19E268677E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 18:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h+LxavVmdJ1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 18:41:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CDAEE867DF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596048098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TG0mMl+qERD/p/lH0bBKbEKr9d96L0uZ7lfwhkdYZqA=;
 b=KR9JPPMalS+NrTCHv0L7YpRCDe8thzUfMKv5JtR1yWWw+FI3wTqp7yl2AuEQKWAyuaTyGe
 EB/qZU1yQKeBaHI7XYsW5uT1axGanapjf4RPoQdxbblEwmlTTboOVHnxROuN5zrhmQkT7/
 jM3R56oZhASXGGmYPq+B4oknrDA5d70=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-6vkF5VIPOJSJlrVnOcezqQ-1; Wed, 29 Jul 2020 14:41:36 -0400
X-MC-Unique: 6vkF5VIPOJSJlrVnOcezqQ-1
Received: by mail-ej1-f71.google.com with SMTP id y10so8889681ejd.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 11:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=TG0mMl+qERD/p/lH0bBKbEKr9d96L0uZ7lfwhkdYZqA=;
 b=g6xpnYl3WP5C51Y3yWnz7xSa7mYtslJCn2oPEysmpW7UoRlvg9zV0zN4tvDfYpiHC7
 11R10AT8MHOElBCqh8S28+dEmMItfZOT5VUjM3hZ022JOy3Sp0i19z8OOiOTWv2tKOoo
 G+TG27XIoO9zBmrVHcaWCaNytpfsrwOILBtaO1B3SWN7Cf+3uH8B9kQTxzwFDtRlvxbp
 fS/IU+cgbjcb5M2V1TN7VZN9EpfDJtM1K1GUhilu0VEsu2ovO3PqkJvV3bErYcS6Rm4l
 REC3sAKlnQn/5d50Rnef+tp9v/R8s2T/I1W/xDz4Kv3yn/w74XpFjX21FQGXA42RS75R
 NaAg==
X-Gm-Message-State: AOAM533k/GdYVtc+651pO52yi7iXvW5rUULp+i+P54SHcj12ggmQmNza
 mK/w4sb9CSWXb5itcrzwLOk91B0cbkLh28ajxqnSr1jMIsL3KMcTYmS+BbPfDPSefFRt6i8z8JX
 +fkG3VVoNgYZ6UJ46wvSbdADfKxPMIcYy8kmqV/47nQ==
X-Received: by 2002:a17:906:57da:: with SMTP id
 u26mr32850944ejr.157.1596048095905; 
 Wed, 29 Jul 2020 11:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqBeHBARqfws6XTYi+Qge5cssgBVDY+eGXTA2/OoOf8zdNHETw9pWTyLkfcSfSO7LFjj/Y7A==
X-Received: by 2002:a17:906:57da:: with SMTP id
 u26mr32850934ejr.157.1596048095726; 
 Wed, 29 Jul 2020 11:41:35 -0700 (PDT)
Received: from [192.168.3.122] (p5b0c648d.dip0.t-ipconnect.de. [91.12.100.141])
 by smtp.gmail.com with ESMTPSA id k22sm2675294edo.24.2020.07.29.11.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 11:41:35 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1 2/6] mm/page_isolation: don't dump_page(NULL) in
 set_migratetype_isolate()
Date: Wed, 29 Jul 2020 20:41:34 +0200
Message-Id: <8EDC210B-0A0F-4FAC-B008-303CE2D65A26@redhat.com>
References: <79240e7f-de16-aee6-fbf6-07e7f184a924@oracle.com>
In-Reply-To: <79240e7f-de16-aee6-fbf6-07e7f184a924@oracle.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
X-Mailer: iPhone Mail (17F80)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Michal Hocko <mhocko@suse.com>, "Michael S.Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Cgo+IEFtIDI5LjA3LjIwMjAgdW0gMjA6MzYgc2NocmllYiBNaWtlIEtyYXZldHogPG1pa2Uua3Jh
dmV0ekBvcmFjbGUuY29tPjoKPiAKPiDvu79PbiA3LzI5LzIwIDExOjA4IEFNLCBEYXZpZCBIaWxk
ZW5icmFuZCB3cm90ZToKPj4gSSBoYXZlIG5vIGNsdWUgd2hhdCB5b3UgbWVhbiB3aXRoICJyZWlu
dHJvZHVjaW5nIHRoaXMgYWJhbmRvbmluZyBvZgo+PiBwYWdlYmxvY2tzIi4gQWxsIHRoaXMgcGF0
Y2ggaXMgY2hhbmdpbmcgaXMgbm90IGRvaW5nIHRoZSBkdW1wX3BhZ2UoKSAtCj4+IG9yIGFtIEkg
bWlzc2luZyBzb21ldGhpbmcgaW1wb3J0YW50Pwo+IAo+IE15IGFwb2xvZ2llcyEhIQo+IAoKTm8g
d29ycmllcywgdGhhbmtzIGZvciByZXZpZXdpbmchIQoKPiBJIGdvdCBjb25mdXNlZCB3aGVuIEkg
c2F3ICdSZXR1cm4gLUVCVVNZJyByZW1vdmVkIGZyb20gdGhlIGNvbW1lbnQgYW5kCj4gYXNzdW1l
ZCB0aGUgY29kZSB3b3VsZCBub3QgcmV0dXJuIGFuIGVycm9yIGNvZGUuICBUaGUgY29kZSBub3cg
bW9yZQo+IGV4cGxpY2l0bHkgZG9lcyByZXR1cm4gLUVCVVNZLiAgTXkgY29uY2VybiB3YXMgd2hl
biBJIGluY29ycmVjdGx5IHRob3VnaHQKPiB5b3Ugd2VyZSByZW1vdmluZyB0aGUgZXJyb3IgcmV0
dXJuIGNvZGUuICBTb3JyeSBmb3IgdGhlIG5vaXNlLgo+IAo+IEFja2VkLWJ5OiBNaWtlIEtyYXZl
dHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgo+IC0tIAo+IE1pa2UgS3JhdmV0ego+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
