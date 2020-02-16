Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14208160267
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 09:07:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 04289203E9;
	Sun, 16 Feb 2020 08:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdV70LOl52yR; Sun, 16 Feb 2020 08:07:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 59EEE20133;
	Sun, 16 Feb 2020 08:07:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C865C0177;
	Sun, 16 Feb 2020 08:07:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EB19C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 821CC81BB5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlafkOgOz1Nh
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:07:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35A25875C2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581840401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zq2Jciyfh3QNHNW/s/RDbN5AoOhPvvGsldB+8B8iIr8=;
 b=ZidOxVfVEHt+ETu/JGm90gtIGt2mBzQFY3dUmZNL8ULInpDFSCcDgT18B5FGLHCrpVHCh3
 FYHXsrZSa+mzEeZM/E2IHC1bndcxRXf1BNpd7bO+20m8ROXApM29UaLwKVRIqElm2z2AgB
 +IPg6FASZd+3Ava2Tsc96jnSt5MsG9Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-wAxJuCXxOjuvfUhA8hvU9w-1; Sun, 16 Feb 2020 03:06:37 -0500
Received: by mail-wr1-f70.google.com with SMTP id p8so6955256wrw.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 00:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=tg6pRNGI3M93MkmGDKKavCH/Drs31lDGSONfCn4eVtc=;
 b=D+Vcf1BzHj0+ikvyQ0FRmiG+PBvWT60iOT3YFZaJbrmeXWxzvbLc3ODOnxiQ8arOkn
 NQVM5clGlj2r9tzh8vIDOhWHru1WNvPfoZjVPXuvuUQofp8FMeMqaiER2XeEznHCj51K
 reQeIQdE1oaPBLdoQw9h8HEkqjRKVnO2F9oixHz7SOLhMiIU68ymx3Dcq0hsGm5BQAQa
 p1iTZ4372JrQ32Yi7IlE6LRpAgJeo7tknJqjxyKB5r+pWVSQVkBXx6yoY1l1a7MvObQf
 eRGrk+FXZn46wUNPvvV9bglYmdMz5SmcBzKKy6jKZnxQeOwBJe6uxx/btQOr2sHiMFz2
 wXdA==
X-Gm-Message-State: APjAAAV2zcUELsK4q781WNgshkNa7+ILjntlas4JN5Cwy7hiEeHGxlQM
 cO+8/nyuhHgjWVtUr2wh7afgl2y6jW1CfmWdrS74Tta0xiPzI9VgfNQKxykfTQnlV9WP3HSaHC5
 wcij5QVBI/R/4SpXN9Ogy1Kn3BTLto4JeQcwhu5wy7A==
X-Received: by 2002:a05:600c:285:: with SMTP id
 5mr14928253wmk.120.1581840395764; 
 Sun, 16 Feb 2020 00:06:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqzALqocRDDkJtM36otpO+eIjpiue5T2EHCcX2/GjFcmgCaxpInGRcqoTFJ9kZNR8McZjTIC9w==
X-Received: by 2002:a05:600c:285:: with SMTP id
 5mr14928233wmk.120.1581840395601; 
 Sun, 16 Feb 2020 00:06:35 -0800 (PST)
Received: from [192.168.3.122] (p5B0C616F.dip0.t-ipconnect.de. [91.12.97.111])
 by smtp.gmail.com with ESMTPSA id
 h128sm16289582wmh.33.2020.02.16.00.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 00:06:35 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] virtio_balloon: Adjust label in virtballoon_probe
Date: Sun, 16 Feb 2020 09:06:34 +0100
Message-Id: <BB1929A5-E718-4FC0-BBCD-E673F4F0CC18@redhat.com>
References: <20200216074735.GA4717@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200216074735.GA4717@ubuntu-m2-xlarge-x86>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailer: iPhone Mail (17D50)
X-MC-Unique: wAxJuCXxOjuvfUhA8hvU9w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, clang-built-linux@googlegroups.com
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

Cgo+IEFtIDE2LjAyLjIwMjAgdW0gMDg6NDcgc2NocmllYiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
ZWNoYW5jZWxsb3JAZ21haWwuY29tPjoKPiAKPiDvu79PbiBTdW4sIEZlYiAxNiwgMjAyMCBhdCAw
ODozNjo0NUFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gCj4+IAo+Pj4+IEFt
IDE2LjAyLjIwMjAgdW0gMDE6NDEgc2NocmllYiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5j
ZWxsb3JAZ21haWwuY29tPjoKPj4+IAo+Pj4g77u/Q2xhbmcgd2FybnMgd2hlbiBDT05GSUdfQkFM
TE9PTl9DT01QQUNUSU9OIGlzIHVuc2V0Ogo+Pj4gCj4+PiAuLi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fYmFsbG9vbi5jOjk2MzoxOiB3YXJuaW5nOiB1bnVzZWQgbGFiZWwKPj4+ICdvdXRfZGVsX3Zx
cycgWy1XdW51c2VkLWxhYmVsXQo+Pj4gb3V0X2RlbF92cXM6Cj4+PiBefn5+fn5+fn5+fn4KPj4+
IDEgd2FybmluZyBnZW5lcmF0ZWQuCj4+PiAKPj4gCj4+IFRoYW5rcywgdGhlcmUgaXMgYWxyZWFk
eSDigJ4gW1BBVENIXSB2aXJ0aW9fYmFsbG9vbjogRml4IHVudXNlZCBsYWJlbCB3YXJuaW5n4oCc
IGZyb20gQm9yaXMgb24gdGhlIGxpc3QuCj4+IAo+PiBDaGVlcnMhCj4+IAo+IAo+IFNvcnJ5IGZv
ciB0aGUgbm9pc2UsIEkgdGhvdWdodCBJIGRpZCBhIHNlYXJjaCBmb3IgZHVwbGljYXRlIHBhdGNo
ZXMgYnV0Cj4gc2VlbXMgSSBtaXNzZWQgaXQgOi8gSSd2ZSBjb21tZW50ZWQgb24gdGhhdCBwYXRj
aC4KCllvdXIgcGF0Y2ggc2hvdWxkIGJlIHRoZSBjb3JyZWN0IG9uZSEgOikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
