Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D048817D5E6
	for <lists.virtualization@lfdr.de>; Sun,  8 Mar 2020 20:38:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61DEA86D80;
	Sun,  8 Mar 2020 19:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jW2BXmYalAJ1; Sun,  8 Mar 2020 19:38:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E44AD8644F;
	Sun,  8 Mar 2020 19:38:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5CD1C0177;
	Sun,  8 Mar 2020 19:38:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 055BAC0177
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DFBA686448
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6DgSZCWfxSn
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 19:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D670186407
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583696305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E16pf1NCMl+kfLBTAjBTSisIDK7+7hi3PMsc/r+KBkA=;
 b=ePjmFQPi+oCf+1oaofUiXdvZPrqR9014GYv2k0vllNEgNUwKhbw5Nv0CDdN/5RtXFclAgq
 XqW2rR2oWTH8uHNccQ5IWxGYgRKtlHsx+2k0FtzgBobncv7eGt+iYfmG9LlaHteUM7KwYH
 ESFG0Gq3eK/A6ZFXUcNZIaMmZEolYkc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-UaHG2gCuPE-v26qep8lzlg-1; Sun, 08 Mar 2020 15:38:21 -0400
X-MC-Unique: UaHG2gCuPE-v26qep8lzlg-1
Received: by mail-wr1-f70.google.com with SMTP id w11so4089014wrp.20
 for <virtualization@lists.linux-foundation.org>;
 Sun, 08 Mar 2020 12:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=OhYbYf/ZU5BRDGgvDuE9sRmfmL1pRAe4uJZ1vmuPsdE=;
 b=P2Q//922FKYt2Ncz8YtEkR7FS68uUcPOqK0eYKaC4/5BIqthyrzaIp9Pjo9O8gSIA1
 9InSjYntz63vEmqnIkCJcClSQpGG3R1Bu7/UGUVY1JsfFysiXPkTZ9/SpSux9+FAMqNI
 Xcql49oEY4oheWJqFaRd+RC59jtPa+WedmNN295ZDu1REfzO+CS76gZyoNzoNvhOmvAy
 A7JkFuSE5A9EL8PD6sMWtlK850IktC16ZTLWeoKbYUSemWVU7yARATalYzzC8zOmNB+4
 J34uuo3gHA9UxcDHvbZRvRjRkBiXEzimRGerF00Ib1DATkps7kU1uiYEYujewF8CJCQ+
 nkYg==
X-Gm-Message-State: ANhLgQ0u/lFohbb4oL7BC6c/xsvhddpzJmtBOA4rPoxScmyKh5EECrX9
 7Y8wcNuQBcIRwsN95u7dAEtj9Ya5OlzEv6ReTlGm517JcYBrTl2r7PByq+sdiFaTPVg7l2vlHrb
 NI60VzFVYWdfUXDPvZDe3i/+ENSs8Ts4+7t4uGysXpg==
X-Received: by 2002:a5d:4406:: with SMTP id z6mr11146784wrq.68.1583696300590; 
 Sun, 08 Mar 2020 12:38:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtR+roVGIB9QcNPPLe+Ab25Z1fyDczychjr0ciDJc5L01xETBP8QuMhOXXxwCs2SpRZL86VGg==
X-Received: by 2002:a5d:4406:: with SMTP id z6mr11146771wrq.68.1583696300395; 
 Sun, 08 Mar 2020 12:38:20 -0700 (PDT)
Received: from [192.168.3.122] (p5B0C674A.dip0.t-ipconnect.de. [91.12.103.74])
 by smtp.gmail.com with ESMTPSA id
 o11sm48616184wrn.6.2020.03.08.12.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2020 12:38:19 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] drivers: virtio: Make out_del_vqs dependent on
 BALLOON_COMPACTION
Date: Sun, 8 Mar 2020 20:38:19 +0100
Message-Id: <4AB99BBC-0EC7-40F0-96ED-04796A73CBA2@redhat.com>
References: <20200306105528.5272-1-vincenzo.frascino@arm.com>
In-Reply-To: <20200306105528.5272-1-vincenzo.frascino@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: iPhone Mail (17D50)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Cgo+IEFtIDA2LjAzLjIwMjAgdW0gMTE6NTYgc2NocmllYiBWaW5jZW56byBGcmFzY2lubyA8dmlu
Y2Vuem8uZnJhc2Npbm9AYXJtLmNvbT46Cj4gCj4g77u/b3V0X2RlbF92cXMgbGFiZWwgaXMgY3Vy
cmVudGx5IHVzZWQgb25seSB3aGVuIEJBTExPT05fQ09NUEFDVElPTgo+IGNvbmZpZ3VyYXRpb24g
b3B0aW9uIGlzIGVuYWJsZWQuIEhhdmluZyBpdCBkaXNhYmxlZCB0cmlnZ2VycyB0aGUKPiBmb2xs
b3dpbmcgd2FybmluZyBhdCBjb21waWxlIHRpbWU6Cj4gCj4gZHJpdmVycy92aXJ0aW8vdmlydGlv
X2JhbGxvb24uYzogSW4gZnVuY3Rpb24g4oCYdmlydGJhbGxvb25fcHJvYmXigJk6Cj4gZHJpdmVy
cy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYzo5NjM6MTogd2FybmluZzogbGFiZWwg4oCYb3V0X2Rl
bF92cXPigJkKPiBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtbGFiZWxdCj4gIDk2MyB8
IG91dF9kZWxfdnFzOgo+ICAgICAgfCBefn5+fn5+fn5+fgo+IAo+IE1ha2Ugb3V0X2RlbF92cXMg
ZGVwZW5kZW50IG9uIEJBTExPT05fQ09NUEFDVElPTiB0byBhZGRyZXNzIHRoZQo+IGlzc3VlLgo+
IAo+IENjOiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4gQ2M6IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmluY2Vuem8gRnJh
c2Npbm8gPHZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20+CgpJIHRoaW5rIHRoaXMgaXMgbm93IHRo
ZSB0aGlyZCBwYXRjaCBvbiB0aGUgbGlzdCB0aGF0IHRyaWVzIHRvIGZpeCB0aGlzIHdhcm5pbmcu
CgpNaWNoYWVsLCBjYW4gd2UgZmluYWxseSBxdWV1ZSBvbmUgb2YgdGhlc2UgKG9yIGlzIHRoZXJl
IG9uZSBpbiAtbmV4dCBhbHJlYWR5IC0gZGlkIG5vdCBjaGVjayk/CgpUaGFua3MKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
