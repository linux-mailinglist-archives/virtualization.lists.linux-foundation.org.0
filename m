Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C22CE987
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 09:27:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B258587A6F;
	Fri,  4 Dec 2020 08:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WHbyGYgnI8Q; Fri,  4 Dec 2020 08:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4DD5D87ADB;
	Fri,  4 Dec 2020 08:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 242EDC013B;
	Fri,  4 Dec 2020 08:27:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8A62C013B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 08:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ACD22881EC
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 08:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXhuZ7oB8u7e
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 08:27:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7B50B88129
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607070454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9Y6WzFRcgbtIi5LBno88YZfeKK7F+ba+sYdLaKYH9w=;
 b=Gg62bac1lWY9C3nvr1LFQkHRGjzBAKmpYjCuFkyRrbjzmO3uFwoH59bMyTpo4oWUwr+dSi
 WxsaxdpEeJhJDagllXhg4XIEm+M/Lyl9Gjr9sAszWEHm0rf6NFDvspz6YrNy3Gmz4AJY9o
 jVEG81aLGyknba9tOFPv4vnyheAcYAc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-rAFceEy1N0i4DdED_JbOuQ-1; Fri, 04 Dec 2020 03:27:32 -0500
X-MC-Unique: rAFceEy1N0i4DdED_JbOuQ-1
Received: by mail-ed1-f70.google.com with SMTP id m8so2061554edq.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 04 Dec 2020 00:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e9Y6WzFRcgbtIi5LBno88YZfeKK7F+ba+sYdLaKYH9w=;
 b=dXQNlUGizj/QBHJ9OTyPI2ToJ0HF+bxe61qhkIhJ72+L7yUwb+qtgnKHe9AZCme4KZ
 Rvl01WNQHvcKfytttSlbj5XF/KROe3cLWXoyB/IR5sutYdSaWGq6ZjgXy1mA/aryj/kJ
 h7on2fgvUFML05JIEFodSIgDnKD2IItXedBjqqMriVzRXsF6sWchTYhoKXXI97DlxfT+
 Ns085ZDVeA102+XcVXjVi0T3XKHLEN3dJFRVeFkPeJMwJImVyLgWKbHR7CfeJXZu+hjO
 TxjDYZsAwWsO2pZLTF8pZoIQCiYREfkdMDOMwdbC6Fvs+/FmMLy/GmJXd0Nae9BzVDjY
 OEeg==
X-Gm-Message-State: AOAM533dHEmUpf7pN1D4wL0KOg+Zoaqcxjh8vbN+O6HyOjaWq7T8Gz3+
 L/63m6nrcPzlTSeYVGr29JVkeRT5CtJgTczVDRf8QUeYux/4+gNF1OVvV828NPs68868XP0OrZk
 v/ngRFm00tjqRgkTPFghKR80PW3iTqubqBnL2PRHwWQ==
X-Received: by 2002:a50:e0ce:: with SMTP id j14mr6573305edl.18.1607070451481; 
 Fri, 04 Dec 2020 00:27:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMIyz5LS2iwvNf1iWyhuXSvOdoCaeoLpxIQO9KF7bm/bHa+j5UQfAthZzEj17BWx0cIuFxUQ==
X-Received: by 2002:a50:e0ce:: with SMTP id j14mr6573281edl.18.1607070451200; 
 Fri, 04 Dec 2020 00:27:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dh23sm1155140edb.15.2020.12.04.00.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 00:27:30 -0800 (PST)
Subject: Re: [PATCH AUTOSEL 5.9 22/33] vhost scsi: add lun parser helper
To: Sasha Levin <sashal@kernel.org>
References: <20201125180102.GL643756@sasha-vm>
 <9670064e-793f-561e-b032-75b1ab5c9096@redhat.com>
 <20201129041314.GO643756@sasha-vm>
 <7a4c3d84-8ff7-abd9-7340-3a6d7c65cfa7@redhat.com>
 <20201129210650.GP643756@sasha-vm>
 <e499986d-ade5-23bd-7a04-fa5eb3f15a56@redhat.com>
 <20201130173832.GR643756@sasha-vm>
 <238cbdd1-dabc-d1c1-cff8-c9604a0c9b95@redhat.com>
 <9ec7dff6-d679-ce19-5e77-f7bcb5a63442@oracle.com>
 <4c1b2bc7-cf50-4dcd-bfd4-be07e515de2a@redhat.com>
 <20201130235959.GS643756@sasha-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6c49ded5-bd8f-f219-0c51-3500fd751633@redhat.com>
Date: Fri, 4 Dec 2020 09:27:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130235959.GS643756@sasha-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 01/12/20 00:59, Sasha Levin wrote:
> 
> It's quite easy to NAK a patch too, just reply saying "no" and it'll be
> dropped (just like this patch was dropped right after your first reply)
> so the burden on maintainers is minimal.

The maintainers are _already_ marking patches with "Cc: stable".  That 
(plus backports) is where the burden on maintainers should start and 
end.  I don't see the need to second guess them.

Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
